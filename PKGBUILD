# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=openshadinglanguage-qfix
pkgver=1.11.13.0
pkgrel=1
pkgdesc="Advanced shading language for production GI renderers (build against opencolorio=2"
arch=(x86_64)
url="https://github.com/imageworks/OpenShadingLanguage"
license=('custom')
depends=('boost-libs' 'openimageio-qfix' 'imath' 'intel-tbb' 'freetype2' 'libpng'
         'libtiff' 'zlib' 'ncurses' 'clang')
makedepends=('boost' 'cmake' 'python' 'llvm' 'ninja')
optdepends=('python: the Python module')
#provides=(openshadinglanguage)
#conflicts=(openshadinglanguage)
source=($pkgname-$pkgver.tar.gz::https://github.com/imageworks/OpenShadingLanguage/archive/Release-${pkgver}.tar.gz
        https://github.com/AcademySoftwareFoundation/OpenShadingLanguage/pull/1361.patch)
sha512sums=('518650541c53a40f0396d702c1664727854bc67ba2c1301835ce11f8f3e17451abc5a56bbf5768a5f10a34e14435349e6a691f5be80f918c0ad76c960d139bd7'
            'a3986d9c458338d1002e119b2c16372fced00a10ddf734b790774f533500f4e3c2cf8fae88431f14a8709d916f9eae4f3f5bdff573e38a1808bc39b0a015ffbf')

prepare() {
  cd OpenShadingLanguage-Release-$pkgver

  patch -Np1 -i "${srcdir}"/1361.patch
}

build() {
  cd OpenShadingLanguage-Release-$pkgver

  cmake \
    -B build \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/opt/osl \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD=14 \
    -DLLVM_STATIC=0 \
    -DSTOP_ON_WARNING=OFF \
    -DOpenImageIO_ROOT=/opt/oiio
  ninja -C build
}

package() {
  cd OpenShadingLanguage-Release-$pkgver

  DESTDIR="$pkgdir/" ninja -C build install

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}

# vim:set ts=2 sw=2 et:
