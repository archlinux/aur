# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=libbpkg
pkgver=0.6.1
pkgrel=1
pkgdesc="build2 package manager library"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbutl>=0.6' 'libbutl<0.7')
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
