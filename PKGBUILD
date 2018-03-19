# Maintainer: bartus <aur@bartus.33mail.com>
pkgname=openshadinglanguage-1.9
pkgver=1.9.7
pkgrel=1
pkgdesc="Advanced shading language for production GI renderers"
arch=(i686 x86_64)
url="https://github.com/imageworks/OpenShadingLanguage"
license=('custom')
depends=('boost-libs' 'openimageio' 'openexr' 'intel-tbb' 'freetype2' 'libpng'
         'libtiff' 'zlib' 'ncurses')
makedepends=('boost' 'cmake' 'llvm' 'clang')
conflicts=('openshadinglanguage')
provides=('openshadinglanguage')
options=(!strip)
source=(https://github.com/imageworks/OpenShadingLanguage/archive/Release-${pkgver}.tar.gz
        )
md5sums=('973e6302c89d9d8090b47587cf21bcf6'
         )

build() {
  cd OpenShadingLanguage-Release-$pkgver/src

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  cmake ../.. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLLVM_STATIC=1 \
    -DENABLERTTI=ON \
    -DOSL_BUILD_CPP11=1 \
    -DSTOP_ON_WARNING=OFF \
    -DCMAKE_INSTALL_LIBDIR=lib 
  make
}

package() {
  cd OpenShadingLanguage-Release-$pkgver/src/build

  make DESTDIR="$pkgdir/" install

  mkdir -p "$pkgdir"/usr/share/OSL/
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/usr/share/doc/OSL/LICENSE "$pkgdir"/usr/share/licenses/$pkgname 
  mv "$pkgdir"/usr/shaders "$pkgdir"/usr/share/OSL/shaders
}

# vim:set ts=2 sw=2 et:
