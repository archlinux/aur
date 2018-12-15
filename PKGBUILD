# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdenetwork
pkgver=1.1.2
pkgrel=2
pkgdesc="Historical copy of the network applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdenetwork"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs")
makedepends=("cmake" "gcc7")
_commit="1029167fdfe0bb9e0d49cb3508b86e332ccebaaf"
source=("https://github.com/KDE/$pkgname/archive/$_commit.tar.gz" "D17603.diff")
sha256sums=('9827be45f6cf2bef17d96b7cea4ee0aa97c139b2d447134df53ad8ab80cf2498'
            '6cdf1ea25c4f0bf5d2e7ec7d072128ec801255ea555725efcc6eaa804e9504c6')

prepare() {
  mkdir -p build
  cd $pkgname-$_commit
  patch -Np1 -i ../D17603.diff
}

build() {
  cd build
  # kmail/kbusyptr.cpp doesn't compile with gcc 8, gcc 7 works though
  # See https://github.com/KDE/kde1-kdenetwork/commit/168059c2344c83d9adad3d6aeec4bbe83d58ffcd#commitcomment-31689915
  export CC=gcc-7
  export CXX=g++-7
  cmake ../$pkgname-$_commit -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install

  cd $pkgname-$_commit
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

  # Duplicate file from kde1-kdelibs
  rm $pkgdir/opt/kde1/share/toolbar/send.xpm
}

# vim:set ts=2 sw=2 et:
