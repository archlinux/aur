# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=seiscomp3
_screlease=jakarta
pkgver=2017.334.05
pkgrel=2
pkgdesc="A seismological software for data acquisition, processing, distribution and interactive analysis."
arch=('x86_64')
url="https://www.seiscomp3.org/"
license=('custom')
depends=('boost-libs' 'libtirpc' 'libxml2' 'mariadb' 'ncurses' 'openssl' 'python2' 'python2-m2crypto' 'qt4')
makedepends=('boost' 'cmake' 'libmariadbclient' 'postgresql-libs' 'python2-sphinx')
optdepends=('postgresql: for using PostgreSQL database')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SeisComP3/${pkgname}/archive/release/${_screlease}/${pkgver}.tar.gz"
        "seiscomp3.sh")
sha256sums=('bee67847d2247c4ae2354c473acf81a184d5a61800d15ad00e24c69e38a40d76'
            '06157296f7cbc1fda7c09254b91143fc0463fe238133ebbff6437165e3000761')

prepare() {
	cd "${pkgname}-release-${_screlease}-${pkgver}"
	sed -i "s/python/python2/g" ./doc/CMakeLists.txt
	sed -i "s/sphinx-build/sphinx-build2/g" ./doc/build-doc.py
	if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
	cd "${pkgname}-release-${_screlease}-${pkgver}/build"
	cmake .. \
    -DCMAKE_INSTALL_PREFIX='/opt/seiscomp3' \
    -DCMAKE_CXX_FLAGS='-I/usr/include/tirpc' \
    -DCMAKE_SHARED_LINKER_FLAGS='-ltirpc' \
    -DCMAKE_EXE_LINKER_FLAGS='-ltirpc -lpthread' \
    -DPYTHON_EXECUTABLE='/usr/bin/python2' \
    -DSC_DOC_GENERATE='ON'	
	make
}

package() {
	cd "${pkgname}-release-${_screlease}-${pkgver}/build"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "${srcdir}/seiscomp3.sh" "${pkgdir}/etc/profile.d/seiscomp3.sh"
	install -Dm644 "${srcdir}/${pkgname}-release-${_screlease}-${pkgver}/COPYING" \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	find "${pkgdir}/opt/seiscomp3" -type f -exec sed -i "s/env python/env python2/g" '{}' \;
}
# vim:set ts=2 sw=2 et:
