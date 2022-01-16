# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=nmxptool
pkgver=2.1.8
pkgrel=2
pkgdesc="Simple command for interacting with NaqsServer and DataServer of Nanometrics Inc."
arch=('x86_64')
url="https://gitlab.rm.ingv.it/matteo.quintiliani/nmxptool"
license=('GPL3')
depends=('libmseed')
makedepends=('git' 'seiscomp')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgname}-${pkgver}")
md5sums=('SKIP')
SEISCOMP_ROOT=/opt/seiscomp

build() {
    cd "${pkgname}-${pkgver}"
	autoreconf --install
    autoconf
	./configure --disable-ew SEISCOMPDIR=$SEISCOMP_ROOT
	make
}

package() {
	cd "${pkgname}-${pkgver}/src"
    install -D -t "${pkgdir}/usr/bin" -m 755 "${pkgname}"
	install -D -t "${pkgdir}${SEISCOMP_ROOT}/share/plugins/seedlink/" -o seiscomp -g seiscomp -m 775 "${pkgname}"
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}${SEISCOMP_ROOT}"
    find "${pkgdir}${SEISCOMP_ROOT}" -type d -exec chmod g+s '{}' \;
}
# vim:set ts=4 sw=4 et:
