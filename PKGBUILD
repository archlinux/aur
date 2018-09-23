pkgname=mingw-w64-glew
pkgver=2.1.0
pkgrel=2
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

prepare () {
  cd ${srcdir}/glew-${pkgver}
  # multiple definition of `DllMainCRTStartup@12'
  sed -i "20882,20892d" src/glew.c
}

build() {
  for _arch in ${_architectures}; do
    cp -R ${srcdir}/glew-${pkgver} ${srcdir}/glew-${pkgver}-${_arch}
    cd ${srcdir}/glew-${pkgver}-${_arch}
    make    SYSTEM=${_config} \
            CC=${_arch}-gcc \
            AR="${_arch}-ar" \
            ARFLAGS=crs \
            RANLIB="${_arch}-ranlib" \
            STRIP="${_arch}-strip" \
            LD="${_arch}-gcc" \
            LDFLAGS.GL="-lopengl32 -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32" \
            LDFLAGS.EXTRA="" \
            CFLAGS.EXTRA="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
            all
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/glew-${pkgver}-${_arch}
    make    SYSTEM=${_config} \
            GLEW_DEST="/usr/${_arch}" \
            GLEW_PREFIX="/usr/${_arch}" \
            DESTDIR="${pkgdir}" \
            install
  done
}

