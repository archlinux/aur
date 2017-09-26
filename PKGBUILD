pkgname=mingw-w64-glew
pkgver=2.1.0
pkgrel=1
pkgdesc="GLEW, The OpenGL Extension Wrangler Library (mingw-w64)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nigels-com/glew/releases/download/glew-${pkgver}/glew-${pkgver}.tgz")
sha256sums=('04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
#Config file to use included in ${srcdir}/glew-${pkgver}/config
_config="mingw"

build() {
  cd ${srcdir}/glew-${pkgver}
  #Patch the makefile (Stolen from original pkgbuild, not sure if required)
  sed -i "s/\<cr\>/crs/g" Makefile
  for _arch in ${_architectures}; do
    cp -R ${srcdir}/glew-${pkgver} ${srcdir}/glew-${pkgver}-${_arch}
    cd ${srcdir}/glew-${pkgver}-${_arch}
    #Patch the config file, required because putting LD as an env var doesn't work for whatever reason.
    sed -i "/^\<LD\>/d" config/Makefile.${_config}
    #gcc replaces ld because ld doesn't work.
    echo "LD := ${_arch}-gcc" >> config/Makefile.${_config}
    make    SYSTEM=${_config} \
            CC=${_arch}-gcc \
            AR="${_arch}-ar" \
            ARFLAGS=crs \
            RANLIB="${_arch}-ranlib" \
            STRIP="${_arch}-strip" \
            LD="${_arch}-gcc" \
            LDFLAGS.GL="-lopengl32 -lgdi32 -luser32 -lkernel32 -lmingw32 -lmsvcrt" \
            GLEW_DEST="${pkgdir}/usr/${_arch}" \
            CFLAGS.EXTRA="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
            all
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/glew-${pkgver}-${_arch}
    make    SYSTEM=${_config} \
            GLEW_DEST="${pkgdir}/usr/${_arch}" \
            install
    sed -i "s|${pkgdir}||g" "${pkgdir}"/usr/${_arch}/lib/pkgconfig/glew.pc
  done
}

