# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=bpkg
pkgver=0.6.0
pkgrel=1
pkgdesc="build2 package manager"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbpkg=0.6.0' 'sqlite>=3.18')
makedepends=('build2=0.6.0' 'gcc>=4.9')
source=("https://download.build2.org/0.6.0/build2-toolchain-0.6.0.tar.gz")
sha256sums=('7c1749abdd145254fadfe3684567767a785e3f78b094a5850d2c3d152e32a264')

build() {
  cd build2-toolchain-0.6.0

  if test -z "$(command -v bpkg && bpkg --version | grep '^bpkg 0.6.0')"
  then
    cd build2
    b config.cxx=g++ config.bin.lib=static

    mkdir "$srcdir/root"

    cd ..
    b configure                           \
      config.cxx=g++                      \
      config.bin.suffix=-stage            \
      config.bin.lib=static               \
      config.install.root="$srcdir/root/usr"   \
      config.install.data_root=/tmp/build2-stage

    b install

    export PATH="$srcdir/root/usr/bin:$PATH"

    b configure                          \
      config.cxx=g++                     \
      config.cc.coptions=-O3             \
      config.bin.lib=static              \
      config.install.root="$srcdir/root/usr"

    export BPKGCMD=bpkg-stage
  else
    export BPKGCMD=bpkg
  fi

  mkdir -p bpkg-final
  cd bpkg-final

  $BPKGCMD create                      \
    cc                                 \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=static              \
    config.install.root="$pkgdir/usr"

  $BPKGCMD add https://pkg.cppget.org/1/alpha
  $BPKGCMD --trust-yes fetch
  $BPKGCMD build --yes sys:libsqlite3 sys:libbutl sys:libbpkg bpkg/0.6.0
}

package() {
  cd build2-toolchain-0.6.0/bpkg-final

  if test -z "$(command -v bpkg && bpkg --version | grep '^bpkg 0.6.0')"
  then
    export PATH="$srcdir/root/usr/bin:$PATH"
    export BPKGCMD=bpkg-stage
  else
    export BPKGCMD=bpkg
  fi

  $BPKGCMD install bpkg

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgname-0.6.0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
