# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: astromele
# Contributor: Mr.Smith1974
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Contributor: Astro Benzene <universebenzene at sina dot com>
pkgname=astrometry.net
pkgver=0.97
pkgrel=1
pkgdesc="Automatic recognition of astronomical images"
arch=('i686' 'x86_64')
url="http://astrometry.net"
license=("BSD-3-Clause-Clear AND GPL-3.0-or-later")
depends=('bzip2'
         'cairo'
         'cfitsio'
         'glibc'
         'gsl'
         'libjpeg-turbo'
         'libpng'
         'netpbm'
         'python'
         'python-astropy'
         'python-matplotlib'
         'python-numpy'
         'swig'
         'wcslib'
         'zlib')
makedepends=('python-setuptools')
backup=(etc/astrometry.cfg)
install=astrometry.net.install
source=("https://github.com/dstndstn/astrometry.net/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e4eef1b658ba5ad462282b661c0ca3a5c538ba1716e853f7970b7b9fa4a33459')

_pyver() {
	python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
	cd $pkgname-$pkgver
	# Keep unneeded files out of DOC_INSTALL_DIR
	sed -e "s/CREDITS LICENSE README.md report.txt/CREDITS README.md/" -i Makefile
}

build() {
	cd $pkgname-$pkgver
	make SYSTEM_GSL=yes
	make SYSTEM_GSL=yes py
	make SYSTEM_GSL=yes extra
}

package() {
	cd $pkgname-$pkgver
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	make install INSTALL_DIR="${pkgdir}/usr" \
		ETC_INSTALL_DIR="${pkgdir}/etc" \
		DOC_INSTALL_DIR="${pkgdir}/usr/share/doc/astrometry" \
		EXAMPLE_INSTALL_DIR="${pkgdir}/usr/share/astrometry/examples" \
		DATA_INSTALL_DIR="${pkgdir}/usr/share/astrometry/data" \
		DATA_FINAL_DIR="/usr/share/astrometry/data" \
		PY_BASE_INSTALL_DIR="${pkgdir}/usr/lib/python$(_pyver .)/site-packages/astrometry" \
		PY_BASE_LINK_DIR="../lib/python$(_pyver .)/site-packages/astrometry"
}
