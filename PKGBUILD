# Maintainer: Ivy Huang <imyxh@imyxh.net>
# Maintainer: Óscar García Amor <ogarcia@moire.org>
# vim: set tw=0 sw=4 et :

pkgname=taskchampion-sync-server
pkgver=0.6.1
pkgrel=1
pkgdesc="The server Taskwarrior syncs to"
arch=('x86_64' 'aarch64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
options=('!lto')
source=(
    "${pkgname}::git+https://github.com/GothenburgBitFactory/taskchampion-sync-server.git#tag=v${pkgver}"
    "${pkgname}.service"
)
b2sums=('d4f00adde5e0bb329496439733dac58d825390efc7382231f016b91adc39da6afdbf1ebac940ba1a980d6ddcbf24579e79020706d39422d866eb77c9ada42aa2'
        'e40adbaa31f8e1a64e17f15f1200e43b7b662e98d37fc0be84efcbe8276e712cd98a3c1053eb47749732b6d983f704cd4a17a9f6c8ff8f19408c7b9bee9b5086')

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${pkgname}.service"
    install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}/target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}/LICENSE"
}
