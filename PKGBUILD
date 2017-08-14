# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=build2-toolchain
pkgver=0.6.0
pkgrel=1
pkgdesc="Open source, cross-platform toolchain for building and packaging C++ code"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc>=4.8')
source=("https://download.build2.org/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7c1749abdd145254fadfe3684567767a785e3f78b094a5850d2c3d152e32a264')

build() {
  cd "$pkgname-$pkgver"

  cd build2
  ./bootstrap.sh g++

  build2/b-boot config.cxx=g++ config.bin.lib=static
  mv build2/b build2/b-boot
}

package() {
  cd "$pkgname-$pkgver"

  build2/build2/b-boot configure        \
    config.cxx=g++                      \
    config.bin.suffix=-stage            \
    config.bin.lib=static               \
    config.install.root="$pkgdir/usr"   \
    config.install.data_root=/tmp/build2-stage

  build2/build2/b-boot install

  export PATH="$pkgdir/usr/bin:$PATH"

  build2/build2/b-boot configure       \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=static              \
    config.install.root="$pkgdir/usr"

  cd ..
  mkdir build2-toolchain-final
  cd build2-toolchain-final

  bpkg-stage create                    \
    cc                                 \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=static              \
    config.install.root="$pkgdir/usr"

  bpkg-stage add https://pkg.cppget.org/1/alpha
  bpkg-stage --trust-yes fetch
  bpkg-stage build --yes build2 bpkg
  bpkg-stage install build2 bpkg

  cd ..
  cd "$pkgname-$pkgver"
  b uninstall

  # Fix path
  sed -i "s/$(echo $pkgdir | sed s/\\//./g)//" "$pkgdir/usr/lib/pkgconfig/libbutl.static.pc"

  # License
  mkdir -p $pkgdir/usr/share/licenses/build2-toolchain/
  cp $pkgdir/usr/share/doc/build2/LICENSE $pkgdir/usr/share/licenses/build2-toolchain/
}
