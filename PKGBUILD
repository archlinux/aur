# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=(mojoshader-hg lib32-mojoshader-hg)
pkgver=1242
pkgrel=1
pkgdesc='library to work with Direct3D shaders on alternate 3D APIs and non-Windows platforms'
arch=('x86_64')
url='https://icculus.org/mojoshader/'
license=('custom:zlib')
makedepends=('mercurial')

source=("hg+https://hg.icculus.org/icculus/mojoshader"
        'optional-spirv-tools.patch')
md5sums=('SKIP'
         '1e2e365b39d32e3372658d2b4070df1a')

pkgver() {
  cd mojoshader
  hg identify -n
}

prepare() {
  cd mojoshader
  hg patch ../optional-spirv-tools.patch
}

build() {
  cd mojoshader
  mkdir -p build build-lib32

  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DPROFILE_ARB1=OFF \
    -DPROFILE_ARB1_NV=OFF \
    -DPROFILE_BYTECODE=OFF \
    -DPROFILE_D3D=OFF \
    -DPROFILE_METAL=OFF \
    -G Ninja
  ninja

  cd ../build-lib32
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DPROFILE_ARB1=OFF \
    -DPROFILE_ARB1_NV=OFF \
    -DPROFILE_BYTECODE=OFF \
    -DPROFILE_D3D=OFF \
    -DPROFILE_METAL=OFF \
    -DENABLE_SPIRV_TOOLS=OFF \
    -G Ninja
  ninja
}

package_mojoshader-hg() {
  provides=('mojoshader')
  conflicts=('mojoshader')

  cd mojoshader
  mkdir -p "$pkgdir"/usr/lib/ "$pkgdir"/usr/include/ "$pkgdir"/usr/share/licenses/mojoshader-hg/
  install -Dm755 build/libmojoshader.so "$pkgdir"/usr/lib/
  install -Dm644 mojoshader.h "$pkgdir"/usr/include/
  install -Dm644 mojoshader_effects.h "$pkgdir"/usr/include/
  install -Dm644 mojoshader_version.h "$pkgdir"/usr/include/
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/mojoshader-hg/
}

package_lib32-mojoshader-hg() {
  depends=(mojoshader-hg)
  provides=('lib32-mojoshader')
  conflicts=('lib32-mojoshader')

  cd mojoshader
  mkdir -p "$pkgdir"/usr/lib32/
  install -Dm755 build-lib32/libmojoshader.so "$pkgdir"/usr/lib32/
}

# vim:set ts=2 sts=2 sw=2 et:
