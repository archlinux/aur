# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=mingw-w64-glew
pkgver=1.11.0
pkgrel=3
pkgdesc="GLEW, The OpenGL Extension Wrangler Library (mingw-w64)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags staticlibs)
provides=('mingw-w64-glew-lib32' 'mingw-w64-glew-pure64')
source=(http://downloads.sourceforge.net/glew/glew-${pkgver}.tgz)
noextract=()
md5sums=('f6d72c7426a5f66580ad09e50816450a')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
#Config file to use included in ${srcdir}/glew-${pkgver}/config
_config="mingw"

build() {
    cd ${srcdir}/glew-${pkgver}
    #Patch the makefile (Stolen from original pkgbuild, not sure if required)
    sed -i "s/\<cr\>/crs/g" Makefile
    sed -i "s/\<GLEW\>/glew32/g" Makefile
    sed -i "s/\<GLEWmx\>/glew32mx/g" Makefile
    unset LDFLAGS
    for _arch in ${_architectures}; do
        cp -R ${srcdir}/glew-${pkgver} ${srcdir}/glew-${pkgver}-${_arch}
        cd ${srcdir}/glew-${pkgver}-${_arch}
        #Patch the config file, required because putting LD as an env var doesn't work for whatever reason.
        sed -i "/^\<LD\>/d" config/Makefile.${_config}
        #gcc replaces ld because ld doesn't work.
        echo "LD := ${_arch}-gcc" >> config/Makefile.${_config}
        #Finally compile
        make    SYSTEM=${_config} \
                CC=${_arch}-gcc \
                AR="${_arch}-ar" \
                RANLIB="${_arch}-ranlib" \
                STRIP="${_arch}-strip" \
                LD="${_arch}-gcc" \
                GLEW_DEST="${pkgdir}/usr/${_arch}" \
                all
    done
}

package() {
    #And then install
    for _arch in ${_architectures}; do
        cd ${srcdir}/glew-${pkgver}-${_arch}
        make    SYSTEM=${_config} \
                CC=${_arch}-gcc \
                AR="${_arch}-ar" \
                RANLIB="${_arch}-ranlib" \
                STRIP="${_arch}-strip" \
                LD="${_arch}-gcc" \
                GLEW_DEST="${pkgdir}/usr/${_arch}" \
                install
    done
}

