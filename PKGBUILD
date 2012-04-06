# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=zeroc-icee
_pkgname=IceE
pkgver=1.3.0
pkgrel=1
pkgdesc="The Internet Communications Engine Embedded (IceE) is a modern distributed computing platform"
arch=('i686' 'x86_64')
url="http://zeroc.com/index.html"
license=('GPL')
makedepends=('mcpp')
source=(http://zeroc.com/download/IceE/1.3/${_pkgname}-${pkgver}-linux.tar.gz)
md5sums=('61768fcaf4664a758e129de8689add8e')


_makedir="${srcdir}/${_pkgname}-${pkgver}"
_builddir="${srcdir}/${_pkgname}-${pkgver}-build"
_datadir="${pkgdir}/usr/share/${_pkgname}"

if [ $CARCH = "i686" ]; then
    _libdir=${_builddir}/lib
else
    _libdir=${_builddir}/lib64
fi


build() {
	# build the slice2cppe translator
	cd "${_makedir}/cpp"
	make
	
	# build cppe
	cd "${_makedir}/cppe"
	make configure
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	make prefix=${_builddir} install
	
	install -dm755 "${pkgdir}/usr/bin"
	cp -r "${_builddir}"/bin/* "${pkgdir}/usr/bin/"
	
	install -dm755 "${pkgdir}/usr/lib"
	cp -r "${_libdir}"/* "${pkgdir}/usr/lib/"
	
	install -dm755 "${pkgdir}/usr/include"
	cp -r "${_builddir}"/include/* "${pkgdir}/usr/include/"
	
	install -dm755 "${_datadir}/slice"
	cp -r "${_builddir}"/slice/* "${_datadir}/slice"
}

