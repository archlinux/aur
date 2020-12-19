# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2164,SC2154

_pkgname="mitsuba"
_pkgver="0.6.0"
pkgname="${_pkgname}-git"
pkgver=0.6.0.r2172.cfeb7766
pkgrel=2
pkgdesc="Mitsuba physically based renderer."
url="http://mitsuba-renderer.org/"
license=("GPL3")
arch=("i686" "x86_64")
depends=(python{,2} "xerces-c" "glew-1.13.0" "openexr" "libpng" "libjpeg" "qt5-base" "qt5-xmlpatterns" "fftw" "collada-dom-mitsuba" boost{,-python2}-libs "pcre")
makedepends=("eigen" "python2-scons" "git" boost{,-python2})
provides=("mitsuba")
conflicts=("mitsuba" "mitsuba-hg")
source=("${_pkgname}::git+https://github.com/mitsuba-renderer/mitsuba.git"
        "python3.9.patch"
        "boost_107400.patch"
        )
sha256sums=('SKIP'
            '6fc5513d95182a84209b4bbdce8cd2eee3bdf25aadd5da35c6b246479c4c8939'
            'c4c571653c86e7c21d702f1f5cb9695edc32bf9fc05f6246e67a660693a32322')

pkgver() {
  cd ${_pkgname}
#  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#  git describe --long --tags | sed        's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd "${_pkgname}"
    export _pyver=$(python -c "print('%d.%d' % __import__('sys').version_info[:2])")
    cp build/config-linux-gcc.py config.py

    ## use collada-dom-mitsuba
    sed -i -e "s:collada-dom:collada-dom-mitsuba:g" config.py
    ## use collada-dom instead of collada-dom-mitsube currrently not working (can't figure why)
    #sed -i -e "s:collada-dom:collada-dom2.4:g" -e "s:collada14dom:collada-dom2.4-dp:g" config.py

    ## update GLINCLUDE path to refere to glew-1.13.0 as mitsuba wont build with glew 2.0.0
    sed -i "/XERCESLIB/aGLINCLUDE      = ['/usr/include/glew-1.13.0']" config.py

    ## fix qt5-base on archlinux provides QtWidgets pkg-config as Qt5Widgets
    sed -i -E "s/('Qt)([a-zA-Z]+')/\15\2/g" src/mtsgui/SConscript data/scons/qt5.py
    ## fix:
    # "You must build your code with position independent code
    #  if Qt was built with -reduce-relocations.
    # "Compile your code with -fPIC (-fPIE is not enough)."
    sed -i "s/^CXXFLAGS[ ]*= \[/&'-fPIC', /g" config.py

    # Scons doesn't honor environment variables
    # user has to export then manually in Sconscript file.
    sed -E -i "s/^(SH)?LINKFLAGS[ ]*= \[/&\'${LDFLAGS}\', /g" config.py
    sed -i "s/^CFLAGS[ ]*= \[/&\'${CFLAGS// /\',\'}\', /g" config.py
    sed -i "s/^CXXFLAGS[ ]*= \[/&\'${CXXFLAGS// /\',\'}\', /g" config.py

    git apply -v ${srcdir}/{python3.9,boost_107400}.patch
}

build() {
    cd "${_pkgname}"
    scons2 --jobs=$((${MAKEFLAGS/-j/} - 1))
}

package() {
    cd "${_pkgname}"
    export _pyver=$(python -c "print('%d.%d' % __import__('sys').version_info[:2])")
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
	install -m644 dist/python/${_pyver}/mitsuba.so ${pkgdir}/usr/lib/python${_pyver}/lib-dynload
	install -m644 data/linux/mitsuba.desktop ${pkgdir}/usr/share/applications
	install -m644 src/mtsgui/resources/mitsuba48.png ${pkgdir}/usr/share/pixmaps
	install -m644 include/mitsuba/*.h ${pkgdir}/usr/include/mitsuba
	install -m644 include/mitsuba/core/* ${pkgdir}/usr/include/mitsuba/core
	install -m644 include/mitsuba/render/* ${pkgdir}/usr/include/mitsuba/render
	install -m644 include/mitsuba/hw/* ${pkgdir}/usr/include/mitsuba/hw
	install -m644 include/mitsuba/bidir/* ${pkgdir}/usr/include/mitsuba/bidir
}
# vim:set ts=2 sw=2 et:
