# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=bpkg
pkgver=0.6.2
pkgrel=1
pkgdesc="build2 package manager"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbpkg>=0.6' 'libbpkg<0.7' 'sqlite>=3.18')
source=("https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz")
sha256sums=('9f451f9e6355cc8c009b23d9a3454e6f010bac491b3b8a81a8364521c217af04')

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
