# Maintainer: Ivy Huang <imyxh@imyxh.net>
# Maintainer: Óscar García Amor <ogarcia@moire.org>
# vim: set tw=0 sw=4 et :

pkgname=taskchampion-sync-server
pkgver=3.0.0
pkgrel=3
pkgdesc="The server Taskwarrior syncs to"
arch=('x86_64' 'aarch64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
optdepends=()
_commit=c1862d30ad6b6d8e54fd983662789a48e0e2feb0
source=(
    "${pkgname}-${pkgver}::git+https://github.com/GothenburgBitFactory/taskchampion-sync-server.git#commit=$_commit"
    "${pkgname}.service"
)
b2sums=('be0858851f1df45fdc5bacd33ac2c7ed96a5bc1b053edbf56fdac7c076dd007d20e6016a16e810f93012bf8cee8987a47a30a4f282aae78e832939bcbc1626b5'
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

