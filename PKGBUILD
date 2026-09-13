# Maintainer: Yubo Cao <cao2006721@gmail.com>

# Unofficial packaging of an unmodified Flectar Mail source build. Flectar does
# not produce or support this package; see TRADEMARKS.md upstream.

pkgname=flectar-mail-git
_srcname=mail
pkgver=0.1.0alpha.5.r7.g9f062a8
pkgrel=1
pkgdesc='Native email client built with Rust and Slint (unofficial build from git main)'
arch=('x86_64')
url='https://github.com/flectar/mail'
license=('AGPL-3.0-only')
depends=('dbus' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11'
         'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
         'xdg-utils')
# rust >= 1.92 and python >= 3.11 (tomllib) are required by the upstream
# manifest and by scripts/stage-linux-metadata.py respectively.
makedepends=('git' 'rust' 'python' 'pkgconf')
optdepends=('xdg-desktop-portal: OAuth sign-in through the system browser and native file dialogs'
            'gnome-keyring: Secret Service provider for storing account credentials'
            'kwallet: alternative Secret Service provider'
            'gnupg: OpenPGP signing and encryption'
            'pinentry: passphrase prompts for GnuPG')
provides=("flectar-mail=$pkgver")
conflicts=('flectar-mail' 'flectar-mail-bin')
# makepkg's `lto` option hands the C dependencies (aws-lc-sys, libsqlite3-sys)
# -flto=auto while giving rustc -C linker-plugin-lto; rust-lld then cannot read
# GCC's LTO bytecode and every symbol in those archives comes out undefined.
# The release profile in Cargo.toml already asks for thin LTO anyway.
options=('!lto')

# PDFium is a pinned, checksum-verified prebuilt in upstream's own packaging
# (scripts/stage-pdfium.py). Fetch it as a declared source instead of letting
# that script download during build(); prepare() fails loudly if upstream moves
# the pin so this never silently ships a different runtime than upstream tested.
_pdfium_release=8044
source=("git+$url.git"
        "pdfium-linux-x64-$_pdfium_release.tgz::https://github.com/bblanchon/pdfium-binaries/releases/download/chromium/$_pdfium_release/pdfium-linux-x64.tgz")
noextract=("pdfium-linux-x64-$_pdfium_release.tgz")
sha256sums=('SKIP'
            'eb142f416aed3a72fc5a02dbd5884868a16cb99dc0cf53e6bdd64afbf67b05f4')

pkgver() {
    cd "$_srcname"
    local tag commits
    tag=$(git describe --tags --abbrev=0)
    commits=$(git rev-list --count "$tag..HEAD")
    # Upstream tags carry a SemVer prerelease hyphen (v0.1.0-alpha.5). Dropping
    # it keeps the version legal for pacman and sorts prereleases before the
    # eventual final 0.1.0, matching the scheme flectar-mail-bin uses.
    printf '%s.r%s.g%s' "${tag#v}" "$commits" "$(git rev-parse --short=7 HEAD)" | sed 's/-//'
}

prepare() {
    cd "$_srcname"

    local pinned_release pinned_sha
    pinned_release=$(sed -n 's|^RELEASE = "chromium/\([0-9]\+\)"$|\1|p' scripts/stage-pdfium.py)
    pinned_sha=$(sed -n 's/^ *"linux-x64": ("\([0-9a-f]\{64\}\)".*/\1/p' scripts/stage-pdfium.py)
    if [[ $pinned_release != "$_pdfium_release" || $pinned_sha != "${sha256sums[1]}" ]]; then
        error "Upstream now pins PDFium chromium/%s (%s)." "$pinned_release" "$pinned_sha"
        error "Update _pdfium_release and sha256sums in this PKGBUILD."
        return 1
    fi

    mkdir -p "$srcdir/pdfium"
    bsdtar -xf "$srcdir/pdfium-linux-x64-$_pdfium_release.tgz" -C "$srcdir/pdfium"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_srcname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # The checked-in .cargo/config.toml pins `jobs = 1` because this dependency
    # graph (Slint's generated UI plus stylo/blitz at codegen-units=1) can
    # exhaust a 16 GiB host. Scale with the builder instead of crawling, but
    # budget ~8 GiB of RAM per job: on a big core count, `nproc` jobs is what
    # actually runs the machine out of memory, not the CPU count.
    local memory_gib jobs
    memory_gib=$(($(awk '/^MemTotal:/ { print $2 }' /proc/meminfo) / 1048576))
    jobs=$((memory_gib / 8))
    (( jobs < 1 )) && jobs=1
    (( jobs > $(nproc) )) && jobs=$(nproc)
    export CARGO_BUILD_JOBS="$jobs"
    msg2 "Building with %s parallel job(s) for %s GiB of RAM" "$jobs" "$memory_gib"
    # The same feature set upstream ships in its Linux packages
    # (scripts/build-deb.sh): software rendering, no WGPU.
    cargo build --frozen --release --bin flectar-mail \
        --no-default-features --features remote-content
}

check() {
    cd "$_srcname"
    # Upstream's own packaging gate: drive the sandboxed PDF worker against a
    # generated fixture. It resolves PDFium relative to the executable, so the
    # installed layout has to be mirrored in a scratch root.
    local root="$srcdir/check-root"
    rm -rf "$root"
    install -Dm755 target/release/flectar-mail "$root/usr/bin/flectar-mail"
    install -Dm644 "$srcdir/pdfium/lib/libpdfium.so" "$root/usr/lib/flectar-mail/libpdfium.so"
    python scripts/test-pdf-preview.py "$root/usr/bin/flectar-mail"
}

package() {
    cd "$_srcname"

    install -Dm755 target/release/flectar-mail "$pkgdir/usr/bin/flectar-mail"

    # src/pdf_preview.rs looks for PDFium at <exe dir>/../lib/flectar-mail,
    # which is where upstream's own .deb and .rpm put it too.
    install -Dm644 "$srcdir/pdfium/lib/libpdfium.so" \
        "$pkgdir/usr/lib/flectar-mail/libpdfium.so"
    install -Dm644 "$srcdir/pdfium/LICENSE" \
        "$pkgdir/usr/lib/flectar-mail/pdfium-licenses/LICENSE"
    install -Dm644 "$srcdir"/pdfium/licenses/* \
        -t "$pkgdir/usr/lib/flectar-mail/pdfium-licenses/licenses/"

    # Stamps the desktop entry and AppStream metainfo with the Cargo version.
    # makepkg exports SOURCE_DATE_EPOCH, so the release date stays reproducible.
    python scripts/stage-linux-metadata.py "$pkgdir"

    install -Dm644 resources/app-icon/flectar-mail-masked-512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.flectar.mail.png"
    install -Dm644 resources/app-icon/flectar-mail-masked.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flectar.mail.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD_PARTY_NOTICES.md \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
    install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSES/"
    install -Dm644 resources/fonts/google-sans-flex/OFL.txt \
        "$pkgdir/usr/share/licenses/$pkgname/google-sans-flex-OFL.txt"
}
