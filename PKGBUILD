# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Martin Ellis <ellism88@gmail.com>

pkgname=kroc-git
pkgver=1.6.0.r0.gd975751
pkgrel=2
pkgdesc="Kent Retargetable occam Compiler. An occam-pi compiler."
arch=('i686' 'x86_64')
url="http://projects.cs.kent.ac.uk/projects/kroc/trac/wiki"
source=("kroc-git::git://github.com/concurrency/kroc#branch=kroc-1.6")
license=('GPL')
depends=('python2' 'libxslt')
optdepends=('mariadb' 'libplayer')
if [ "$CARCH" = "x86_64" ]; then
   depends+=('gcc-multilib')
   optdepends+=('lib32-libpng'
                'lib32-sdl'
                'lib32-sdl_sound'
                'lib32-freeglut'
                'lib32-libxmu'
                'lib32-mesa')
else
   optdepends+=('libpng'
                'sdl'
                'sdl_sound'
                'freeglut'
                'libxmu'
                'mesa')
fi

makedepends=('git')
md5sums=('SKIP')
conflicts=('kroc-devel-git' 'kroc-svn')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/^kroc-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/python/python2/' runtime/ccsp/include/Makefile.am
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' tools/kroc/occbuild.in
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' tools/occamdoc/occamdoc.in
  autoreconf -vfi
}            

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}  


package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}