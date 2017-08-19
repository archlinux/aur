# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=build2
pkgver=0.6.0
pkgrel=1
pkgdesc="build2 build system"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbutl=0.6.0')
makedepends=('gcc>=4.9')
source=("https://download.build2.org/0.6.0/build2-toolchain-0.6.0.tar.gz")
sha256sums=('7c1749abdd145254fadfe3684567767a785e3f78b094a5850d2c3d152e32a264')

build() {
  cd build2-toolchain-0.6.0

  if test -z "$(command -v bpkg && bpkg --version | grep '^bpkg 0.6.0')"
  then
    cd build2
    ./bootstrap.sh g++
    build2/b-boot config.cxx=g++ config.bin.lib=static
    mv build2/b build2/b-boot

    mkdir "$srcdir/root"

    cd ..
    build2/build2/b-boot configure        \
      config.cxx=g++                      \
      config.bin.suffix=-stage            \
      config.bin.lib=static               \
      config.install.root="$srcdir/root/usr"   \
      config.install.data_root=/tmp/build2-stage

    build2/build2/b-boot install

    export PATH="$srcdir/root/usr/bin:$PATH"

    build2/build2/b-boot configure       \
      config.cxx=g++                     \
      config.cc.coptions=-O3             \
      config.bin.lib=static              \
      config.install.root="$srcdir/root/usr"

    export BPKGCMD=bpkg-stage
  else
    export BPKGCMD=bpkg
  fi

  mkdir -p build2-g++-release
  cd build2-g++-release

  $BPKGCMD create                      \
    cc                                 \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=shared              \
    config.install.root="$pkgdir/usr"

  $BPKGCMD add https://pkg.cppget.org/1/alpha
  $BPKGCMD --trust-yes fetch
  $BPKGCMD build --yes sys:libbutl build2/0.6.0
}

package() {
  cd build2-toolchain-0.6.0/build2-g++-release

  if test -z "$(command -v bpkg && bpkg --version | grep '^bpkg 0.6.0')"
  then
    export PATH="$srcdir/root/usr/bin:$PATH"
    export BPKGCMD=bpkg-stage
  else
    export BPKGCMD=bpkg
  fi

  $BPKGCMD install build2

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgname-0.6.0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
