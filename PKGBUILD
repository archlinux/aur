# Maintainer: David Bernhard <davidbernhard.w@gmail.com>
pkgname=simple-reaction-daemon
pkgver=0.0.8
pkgrel=1
pkgdesc="Simple Reaction Daemon - Periodically ping hosts and run custom actions if they fail/succeed"
arch=('any')
_srctag=v${pkgver}
url="https://github.com/dbernhard-0x7CD/simple-reaction-daemon/releases/tag/$_srctag"
license=('GPL2')
depends=(libsystemd libconfig glibc)
makedepends=()
checkdepends=()
optdepends=()
backup=('etc/srd/srd.conf')
options=('strip')
install=
changelog="CHANGELOG.md"
source=(
    "$pkgname::git+https://github.com/dbernhard-0x7CD/simple-reaction-daemon"
    'srd.conf')
sha256sums=('SKIP'
            '6629d6cc0c7df342d586ad75fdbc96547d64d98cf44248deb3229d3c74abf863')
validpgpkeys=()


prepare() {
    echo 0 > /dev/null
}

build() {
    cd "${pkgname}"
    git checkout -q ${_srctag}

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
