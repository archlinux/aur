# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xcl-git
pkgver=0.0.0.291.672.g1410ba8
pkgrel=5
pkgdesc="An native-code implementation of Common Lisp"
arch=('i686' 'x86_64')
url="http://armedbear.org/"
license=('GPL')
depends=('gcc-libs') 
makedepends=('git')
provides=('common-lisp' 'xcl')
conflicts=('xcl')
source=('git://github.com/gnooth/xcl.git' 'etcxclrc')
md5sums=('SKIP' '6f426ad20c0086460067915091cefae8')
backup=('etc/xclrc')
options=('!makeflags')
_gitname="xcl"

pkgver() {
  cd $_gitname
  # Git tag
  echo $(git describe --always|sed 's/-/./g')
}

build() {
  cd "$srcdir/$_gitname"
  make
  yes "(quit)"|./xcl --eval "(REBUILD-LISP)"
}

package() {
  install -Dm755 "$srcdir/$_gitname/xcl" "$pkgdir/usr/bin/xcl"
  install -Dm644 "$srcdir/etcxclrc" "$pkgdir/etc/xclrc"
  install -dm755 "$pkgdir/usr/share/xcl"
  cd "$srcdir/$_gitname"
  cp -r lisp compiler clos "$pkgdir/usr/share/xcl"
  find $pkgdir/usr/share -name "*.xcl" -type f -exec rm {} \;
}
