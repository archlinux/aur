# Maintainer: maz-1 < ohmygod19993 at gmail dot com >

_pkgname="mitsuba"
pkgname="${_pkgname}-hg"
pkgver=2135
pkgrel=1
pkgdesc="Mitsuba physically based renderer."
url="http://mitsuba-renderer.org/"
license=("GPL3")
arch=("any")
depends=("python" "eigen" "xerces-c" "glew" "openexr" "libpng" "libjpeg" "qt4" "fftw" "collada-dom-mitsuba" "boost" "pcre")
makedepends=("scons" "mercurial")
provides=("mitsuba")
conflicts=("mitsuba")
source=("${_pkgname}::hg+https://www.mitsuba-renderer.org/repos/_10" "fix_boost_include.patch")
sha256sums=("SKIP" "SKIP")

_pyver=`python3 --version | grep -oP '(?<= )\d\.\d'`

pkgver() {
  cd $srcdir/${_pkgname}
  hg id -n
}

prepare() {
    cd "${_pkgname}"
    patch -p1 < ../fix_boost_include.patch
    cp build/config-linux-gcc.py config.py
    sed -i "s:'/usr/include/collada-dom:'/usr/include/collada-dom2.4:g" config.py
    
}

build() {
    cd "${_pkgname}"
    #export MITSUBA_PYVER=${_pyver}
    source setpath.sh
    scons --jobs=$[${MAKEFLAGS/-j/} - 1]
}

package() {
    #cd "${_pkgname}"
    #scons -Q PREFIX="${pkgdir}/usr" install
    	install -d \
		${pkgdir}/usr/bin \
		${pkgdir}/usr/lib \
		${pkgdir}/usr/share/mitsuba/plugins \
		${pkgdir}/usr/share/mitsuba/data/schema \
		${pkgdir}/usr/share/mitsuba/data/ior \
		${pkgdir}/usr/share/mitsuba/data/microfacet \
		${pkgdir}/usr/share/applications \
		${pkgdir}/usr/share/pixmaps \
		${pkgdir}/usr/include/mitsuba/{core,hw,render,bidir} \
		${pkgdir}/usr/lib/python2.7/lib-dynload \
		${pkgdir}/usr/lib/python${_pyver}/lib-dynload

	cd ${_pkgname}
	install -m755 dist/mitsuba dist/mtsgui dist/mtssrv dist/mtsutil ${pkgdir}/usr/bin
	install -m755 dist/libmitsuba-core.so \
		dist/libmitsuba-hw.so \
		dist/libmitsuba-render.so \
		dist/libmitsuba-bidir.so \
		${pkgdir}/usr/lib
	install -m755 dist/plugins/* ${pkgdir}/usr/share/mitsuba/plugins
	install -m644 dist/data/schema/* ${pkgdir}/usr/share/mitsuba/data/schema
	install -m644 dist/data/ior/* ${pkgdir}/usr/share/mitsuba/data/ior
	install -m644 dist/data/microfacet/* ${pkgdir}/usr/share/mitsuba/data/microfacet
	install -m644 dist/python/2.7/mitsuba.so ${pkgdir}/usr/lib/python2.7/lib-dynload
	install -m644 dist/python/2.7/mitsuba.so ${pkgdir}/usr/lib/python${_pyver}/lib-dynload
	install -m644 data/linux/mitsuba.desktop ${pkgdir}/usr/share/applications
	install -m644 src/mtsgui/resources/mitsuba48.png ${pkgdir}/usr/share/pixmaps
	install -m644 include/mitsuba/*.h ${pkgdir}/usr/include/mitsuba
	install -m644 include/mitsuba/core/* ${pkgdir}/usr/include/mitsuba/core
	install -m644 include/mitsuba/render/* ${pkgdir}/usr/include/mitsuba/render
	install -m644 include/mitsuba/hw/* ${pkgdir}/usr/include/mitsuba/hw
	install -m644 include/mitsuba/bidir/* ${pkgdir}/usr/include/mitsuba/bidir
}
