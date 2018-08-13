# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=scavenger-git
_realname=scavenger
pkgver=1.0.0.r6.g9e025eb
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
            '7c48cb91f6b9e9e65fd52ef32fc27d234b82457d9452ff611b23074c19a16595')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_realname}"
    cargo build --release
}

check() {
    cd "${srcdir}/${_realname}"
    cargo test
}

prepare() {
    cd "${srcdir}/${_realname}"
    # disable log in file
    sed -i "s/logfile_log_level:.*/logfile_log_level: 'Off'/g" config.yaml
}

package() {
    cd "${srcdir}/${_realname}/target/release"

    install -Dm755 "${_realname}" "${pkgdir}/usr/bin/${_realname}"

    install -Dm644 "${srcdir}/${_realname}/config.yaml" "${pkgdir}/usr/share/${_realname}/config.yaml"

    install -Dm644 "${srcdir}/${_realname}.service" "${pkgdir}/usr/lib/systemd/user/${_realname}.service"
}
