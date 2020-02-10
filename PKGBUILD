# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Previous maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=bpkg
pkgver=0.12.0
pkgrel=2
pkgdesc="build2 package manager"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbpkg>=0.12' 'sqlite>=3.18')
source=("https://download.build2.org/$pkgver/build2-toolchain-$pkgver.tar.xz")
sha512sums=('fa59e86925b4d64bf22dea01af1fec2772e59dee467129f29e69921e4faacc5d6f1ad51341179ad48ad00181ef74400e8590a2b62031040df400c6210c242359')

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

  if test -z "$(command -v b && b --version | grep '^build2 0\.12\.')"
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
