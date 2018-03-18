# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xcl-git
pkgver=0.0.0.291.673.ge576a5e
pkgrel=4
pkgdesc="An native-code implementation of Common Lisp"
arch=('i686' 'x86_64')
url="http://armedbear.org/"
license=('GPL')
depends=('gcc-libs') 
makedepends=('git' 'gcc49')
provides=('common-lisp' 'xcl')
conflicts=('xcl')
source=('git://github.com/gnooth/xcl.git' 'etcxclrc')
sha256sums=('SKIP'
            '5db66c159d976f83b784d0ec685c5449bb5a7db8e7059c43b95d132c17a10bdb')
backup=('etc/xclrc')
options=('!makeflags')
_gitname="xcl"

pkgver() {
  cd $_gitname
  # Git tag
  echo $(git describe --always|sed 's/-/./g')
}

prepare() {
   cd $_gitname/kernel
   sed -i 's/CC=g++/CC=g++-4.9/' Makefile
   sed -i 's/-m64/-m64 -fPIC/' Makefile 
   cd ../gc
   sed -i 's/CC=gcc/CC=gcc-4.9/' Makefile
   sed -i 's/CC=g++/CC=g++-4.9/' Makefile
}

build() {
  cd $_gitname
  make 
  yes "(quit)"|./xcl --eval "(REBUILD-LISP)"
}

package() {
  install -Dm755 "$srcdir"/$_gitname/xcl "$pkgdir"/usr/bin/xcl
  install -Dm644 "$srcdir"/etcxclrc "$pkgdir"/etc/xclrc
  install -dm755 "$pkgdir"/usr/share/xcl
  cd "$srcdir"/$_gitname
  cp -r lisp compiler clos "$pkgdir"/usr/share/xcl
  find "$pkgdir"/usr/share -name "*.xcl" -type f -exec rm {} \;
}
