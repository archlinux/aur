# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Previous maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=libbpkg
pkgver=0.12.0
pkgrel=2
pkgdesc="build2 package manager library"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbutl>=0.12')
source=("https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz")
sha256sums=('a0ecf9930b873242a0164653411caca2cc5c095abda5ee7bda800f1b0f93e396')

build() {
  cd build2-toolchain-$pkgver

  if test -z "$(command -v b && b --version | grep '^build2 0\.12\.')"
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

  if test -z "$(command -v b && b --version | grep '^build2 0\.12\.')"
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
