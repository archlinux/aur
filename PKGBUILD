# Maintainer: David Bernhard <davidbernhard.w@gmail.com>
pkgname=simple-reaction-daemon
pkgver=0.0.2
pkgrel=1
pkgdesc="Simple Reaction Daemon - Periodically ping hosts and run custom actions if they are unreachable"
arch=('any')
_srctag=v${pkgver}
url="https://github.com/dbernhard-0x7CD/simple-reaction-daemon/releases/tag/$_srctag"
license=('GPL2')
depends=(libsystemd libconfig glibc)
makedepends=()
checkdepends=()
optdepends=()
replaces=()
backup=('etc/srd/srd.conf')
options=('strip')
install=
changelog=
source=(
    "$pkgname::git+https://github.com/dbernhard-0x7CD/simple-reaction-daemon"
    'srd.conf')
sha256sums=('SKIP'
            'b96840484ced981d203de18da82e2710e21335799aa3f5e910f5d749b4252245')
validpgpkeys=()


prepare() {
    echo 0 > /dev/null
}

build() {
    cd "${pkgname}"
    git checkout -q ${_srctag}

    git submodule init
    git submodule update
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname}/srd" "${pkgdir}/usr/bin/srd"
    install -Dm644 "${srcdir}/${pkgname}/srd.service" "${pkgdir}/usr/lib/systemd/system/srd.service"
    install -Dm644 "${srcdir}/${pkgname}/ThirdPartyLicenses.txt" "${pkgdir}/usr/share/srd/ThirdPartyLicenses.txt"

    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/srd/LICENSE"

    # default configuration
    install -Dm644 ./srd.conf "${pkgdir}/etc/srd/srd.conf"
}
