# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=plustache-git
pkgver=124.0d6cba4
pkgrel=1
pkgdesc="Basic port of mustache templating to C++"
url="https://github.com/mrtazz/plustache"
arch=( 'i686' 'x86_64' )
license=( 'MIT' )
depends=( 'boost' )
makedepends=( 'git' )
source=( "git+https://github.com/mrtazz/plustache/" )
md5sums=('SKIP')

_gitname=plustache

pkgver() {
  cd "$srcdir/$_gitname"
  # Use the tag of the last commit
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i -e "s,boost_regex-mt,boost_regex,g" \
         -e "s,LDFLAGS=.*,\0 -version-info 3:0:3,g" \
         Makefile.am
}

build() {
  cd "$srcdir/$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
}
