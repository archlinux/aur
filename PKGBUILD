# Maintainer: Joshua Cold <joshzcold@gmail.com>
# riptide-browser: built from the release tag, against the CEF build its cef crate pins.
# The versions and checksum are updated at each release.
pkgname=riptide-browser
pkgver=0.5.0
pkgrel=1
_cef=154.0.34+g14c5a08+chromium-154.0.8037.98
pkgdesc="Keyboard-driven web browser with vim-like bindings, built on CEF"
arch=('x86_64')
url="https://joshzcold.github.io/riptide/"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'hicolor-icon-theme'
         'libcups' 'libdrm' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr' 'mesa'
         'nspr' 'nss' 'pango' 'systemd-libs')
makedepends=('cargo' 'cmake' 'git' 'ninja')
conflicts=('riptide-browser-bin' 'riptide' 'riptide-bin')
options=('!strip' '!debug' '!lto')
source=("riptide::git+https://github.com/joshzcold/riptide.git#tag=v${pkgver}"
        "https://cef-builds.spotifycdn.com/cef_binary_${_cef}_linux64_minimal.tar.bz2")
# The CEF index publishes SHA-1 checksums only.
sha1sums=('SKIP'
          '15c91ad767097217b2e82ba8b933fe30b134be69')

prepare() {
    # Lay CEF out the way the cef-dll-sys build script expects it in CEF_PATH.
    local dist="cef_binary_${_cef}_linux64_minimal"
    rm -rf cef
    mkdir cef
    cp -a "$dist"/Release/. "$dist"/Resources/. cef/
    cp -a "$dist"/{CMakeLists.txt,cmake,include,libcef_dll,CREDITS.html} cef/
    printf '{"type":"minimal","name":"%s.tar.bz2","sha1":"%s"}\n' "$dist" "${sha1sums[1]}" > cef/archive.json

    cd riptide
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd riptide
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CEF_PATH="$srcdir/cef"
    cargo build --frozen --release --bin riptide
    # Stages the runtime files, as for the release tarball, and unpacks them.
    scripts/package-linux.sh "$pkgver"
    tar -xzf "dist/riptide-${pkgver}-linux-x86_64.tar.gz" -C "$srcdir"
}

package() {
    cd "riptide-${pkgver}-linux-x86_64" || return 1
    install -d "$pkgdir/opt/riptide" "$pkgdir/usr/bin"
    cp -a . "$pkgdir/opt/riptide/"
    # The sandbox helper must be setuid root when the kernel doesn't allow
    # unprivileged user namespaces; Arch allows them, so this is a fallback.
    chmod 4755 "$pkgdir/opt/riptide/chrome-sandbox"
    ln -s /opt/riptide/riptide "$pkgdir/usr/bin/riptide"
    install -Dm644 riptide.desktop "$pkgdir/usr/share/applications/riptide.desktop"
    install -Dm644 riptide.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/riptide.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
