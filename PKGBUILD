# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=detmon
pkgver=1.3.9_3
pkgrel=2
pkgdesc="ESO DETMON detector characterization"
url="https://www.eso.org/sci/software/pipelines/detmon/detmon-pipe-recipes.html"
arch=('x86_64')
license=('GPL2')
depends=(esorex)
makedepends=(cpl)
provides=()
conflicts=()
replaces=()
backup=()
source=(https://ftp.eso.org/pub/dfs/pipelines/instruments/detmon/detmon-kit-${pkgver//_/-}.tar.gz)
sha256sums=('0478d2994e8b94eea80db7eac8ba2a7b8e9b138c673b2d2f328ef615d4d360ed')


build() {

    # In case everything build in one-go variables may not be read.
    [[ -z "${CPLDIR}" ]] && . /etc/profile.d/cpl.sh
    export C_INCLUDE_PATH=${CPLDIR}/include:${C_INCLUDE_PATH}
    export LD_LIBRARY_PATH=${CPLDIR}/lib:${LD_LIBRARY_PATH}
	
	cd $srcdir/${pkgname}-kit-${pkgver//_/-}
	tar zxf ${pkgname}-${pkgver%_?}.tar.gz
	cd ${pkgname}-${pkgver%_?}
	./configure --prefix=/opt/esopipes --with-cpl=${CPLDIR}
	make

}

package() {

	cd $srcdir/${pkgname}-kit-${pkgver//_/-}/${pkgname}-${pkgver%_?}
	make DESTDIR=${pkgdir} install

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=4 sw=4 et:
