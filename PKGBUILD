# Maintainer: Ivy Huang <imyxh@imyxh.net>
# Maintainer: Óscar García Amor <ogarcia@moire.org>
# vim: set tw=0 sw=4 et :

pkgname=taskchampion-sync-server
pkgver=3.0.0
pkgrel=2
pkgdesc="The server Taskwarrior syncs to"
arch=('x86_64' 'aarch64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
optdepends=()
_commit=af918bdf0dea7f7b6e920680c947fc37b37ffffb
source=(
    "${pkgname}-${pkgver}::git+https://github.com/GothenburgBitFactory/taskchampion-sync-server.git#commit=$_commit"
    "${pkgname}.service"
)
b2sums=('8a78939346296b0326a9c34b803a706768d934b3179b1ec7429cc3a3f49e866d3dbb807f5c8999ab97ecdad7ff5f12b1a93837cb10a150bb476f5bdd6d52d7af'
        'e40adbaa31f8e1a64e17f15f1200e43b7b662e98d37fc0be84efcbe8276e712cd98a3c1053eb47749732b6d983f704cd4a17a9f6c8ff8f19408c7b9bee9b5086')
options=('!lto')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${pkgname}.service"
    install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}-${pkgver}/target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}

