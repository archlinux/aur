# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=scavenger-git
_realname=scavenger
pkgver=v.1.6.8.r0.g03182b1
pkgrel=1
pkgdesc="Burstcoin Rust miner"
arch=('x86_64')
url="https://github.com/PoC-Consortium/scavenger"
license=('GPL3')
options=('strip' '!emptydirs')
depends=('gcc-libs')
makedepends=('git' 'rust')
install=${pkgname}.install
conflicts=('scavenger')
source=("git+https://github.com/PoC-Consortium/${_realname}.git"
        "${_realname}.service")
sha256sums=('SKIP'
            '0fa34d211f5dead13c9f5e2a1efd39d3bd14d805497e70b9c18981d76b31dd56')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_realname}"
    sed -i "s/#!\[feature(stdsimd)\]//g" src/main.rs # #![feature] may not be used on the stable release channel
    cargo build --release --features=simd # --features opencl
}

check() {
    cd "${srcdir}/${_realname}"
    cargo test
}

prepare() {
    cd "${srcdir}/${_realname}"
    # disable log in file
    sed -i "s/logfile_log_level:.*/logfile_log_level: 'Off'/g" config.yaml
    # disable progress
    sed -i "s/show_progress:.*/show_progress: false/g" config.yaml
}

package() {
    cd "${srcdir}/${_realname}/target/release"

    install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"

    install -Dm644 "${srcdir}/${_realname}/config.yaml" "${pkgdir}/usr/share/${_realname}/config.yaml"

    install -Dm644 "${srcdir}/${_realname}.service" "${pkgdir}/usr/lib/systemd/user/${_realname}.service"
}
