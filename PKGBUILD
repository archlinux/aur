# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=libbpkg
pkgver=0.6.2
pkgrel=1
pkgdesc="build2 package manager library"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbutl>=0.6' 'libbutl<0.7')
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

  cd $pkgname

  $BCMD configure                      \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=shared              \
    config.install.root="$pkgdir/usr"  \
    config.import.libbutl=''

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
  $BCMD install

  mv "$pkgdir/usr/lib/pkgconfig/$pkgname.shared.pc" "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
  sed -i 's/-[IL][^ ]*//g' "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
