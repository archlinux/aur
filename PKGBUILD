# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=bpkg
pkgver=0.6.1
pkgrel=1
pkgdesc="build2 package manager"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbpkg>=0.6' 'libbpkg<0.7' 'sqlite>=3.18')
source=("https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz")
sha256sums=('4c6167e1a041f29f6072c892ec6316fa86ba31f45fce08f2f964d8b11c8db03a')

build() {
  cd build2-toolchain-$pkgver

  if test -z "$(command -v b && b --version | grep '^build2 0\.6\.')"
  then
    cd build2
    if ! test -x build2/b-boot; then
      ./bootstrap.sh g++
    fi
    cd ..
    export BCMD="$(pwd)/build2/build2/b-boot"
  else
    export BCMD=b
  fi

  $BCMD configure                      \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=static              \
    config.install.root="$pkgdir/usr"  \
    config.import.libbutl=''           \
    config.import.libbpkg=''           \
    config.import.libsqlite3=''

  cd $pkgname
  $BCMD "update($pkgname/)"
}

package() {
  cd build2-toolchain-$pkgver

  if test -z "$(command -v b && b --version | grep '^build2 0\.6\.')"
  then
    export BCMD="$(pwd)/build2/build2/b-boot"
  else
    export BCMD=b
  fi

  cd $pkgname
  $BCMD install config.install.root="$pkgdir/usr"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
