# Maintainer: Christian Balcom <robot.inventor@gmail.com>
#
# whisper-git: GPU-accelerated Git client (Vulkan + winit, retained-mode UI).
#
# Bumping this for a new release:
#   1. Tag the upstream release: `git tag v0.x.y && git push --tags`
#   2. Update pkgver below; reset pkgrel to 1.
#   3. updpkgsums   (refreshes the source tarball checksum)
#   4. makepkg --syncdeps --clean   (verify it builds)
#   5. makepkg --printsrcinfo > .SRCINFO
#   6. Push to AUR (separate `aur:whisper-git` git remote).

pkgname=whisper-git
pkgver=0.3.6
pkgrel=1
pkgdesc="GPU-accelerated Git client built in Rust with Vulkan"
arch=('x86_64')
url="https://github.com/computer-whisperer/whisper-git"
license=('MIT OR Apache-2.0')
# Runtime: Vulkan loader (driver ICD comes from mesa/NVIDIA/etc., not us),
# wayland + libxkbcommon for winit, dbus for the secret-service keyring
# backend and for arboard's wayland-data-control clipboard path.
depends=('vulkan-icd-loader' 'wayland' 'libxkbcommon' 'dbus' 'gcc-libs' 'glibc')
# Arch's default makepkg.conf enables LTO. The `ring` crate's static
# C/asm objects don't survive rustc's LTO link step (lld drops the
# static lib referenced via cargo:rustc-link-lib=static), producing
# undefined ring_core_* symbol errors. Opt out here.
options=('!lto')
# 'cargo' is provided by both `rust` and `rustup` — don't force one of them.
makedepends=('cargo' 'vulkan-headers' 'glslang')
optdepends=('gnome-keyring: libsecret backend for credential storage'
            'kwallet: KDE backend for credential storage'
            'xorg-server-xwayland: run on X11 / XWayland')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
# Refresh with `updpkgsums` whenever pkgver bumps.
sha256sums=('da662c09556bb2abca73e184d3acd03068e0ecd597bebad000c2a6716b485814')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR="${srcdir}/target"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 "${srcdir}/target/release/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 packaging/aur/whisper-git.desktop \
        "${pkgdir}/usr/share/applications/whisper-git.desktop"
    install -Dm644 assets/git-client-icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm644 LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
