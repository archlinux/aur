# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=r1182.d7d3aaf
pkgrel=1
pkgdesc="A fast monolithic web-framework of Scheme"
arch=('x86_64')
url="http://web-artanis.com/"
license=('GPL')
depends=('guile')
makedepends=('git')
provides=('artanis')
conflicts=('artanis')
source=("git+https://gitlab.com/NalaGinrut/artanis.git")
md5sums=('SKIP')
options=('!strip')
_gitname="artanis"

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  ./autogen.sh 
  GUILE_EFFECTIVE_VERSION=2.2 ./configure --prefix=/usr \
			 --bindir=/usr/bin \
			 --datarootdir=/usr/share \
			 --infodir=/usr/share/info 
  make
  make docs
}

check() {
  cd "$srcdir"/"$_gitname"
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  # repair
  cp -r $pkgdir/{share,bin} $pkgdir/usr
  rm -r $pkgdir/{share,bin}
}
