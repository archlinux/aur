# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Martin Ellis <ellism88@gmail.com>

pkgname=kroc-devel-git
pkgver=20150215
pkgrel=1
pkgdesc="Kent Retargetable occam Compiler. An occam-pi compiler."
arch=('i686' 'x86_64')
url="http://projects.cs.kent.ac.uk/projects/kroc/trac/wiki"
source=("kroc-devel-git::git://github.com/concurrency/kroc#branch=master")
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
conflicts=('kroc-git' 'kroc-svn')

pkgver() {
  cd "$srcdir/$pkgname"
  date +%Y%m%d --date="$(git show -s --format=%cD HEAD)"
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