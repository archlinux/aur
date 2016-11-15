# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kde1-kdenetwork
pkgver=1.1.2
pkgrel=1
pkgdesc="Historical copy of the network applications module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://github.com/KDE/kde1-kdenetwork"
license=("GPL2")
groups=("kde1")
depends=("qt1" "kde1-kdelibs")
makedepends=("cmake")
_commit="3cefe8bc58885a7aa77abff02cf7e4dc390804a2"
source=("https://github.com/KDE/$pkgname/archive/$_commit.zip" "kmail_cmake.diff")
sha256sums=('b493d6dc1d0fa91d6cb4964b6b216d829e8e27dde2929b904791d476db78df0c'
            'f0578385eb55d3a1ee960bd927396af8840b6fa6746750148b2b3e90c2fa5534')

prepare() {
  cd $srcdir/$pkgname-$_commit
  patch -p1 kmail/CMakeLists.txt < $srcdir/kmail_cmake.diff
}

build() {
  cd $srcdir/$pkgname-$_commit
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_LIBRARY_PATH='/opt/kde1/lib'
  make
}

package() {
  cd $srcdir/$pkgname-$_commit
  cd build
  make DESTDIR="$pkgdir/" install
  cd ..  
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

  # Duplicate file from kde1-kdelibs
  rm $pkgdir/opt/kde1/share/toolbar/send.xpm
}

# vim:set ts=2 sw=2 et:
