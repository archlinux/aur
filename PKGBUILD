# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=geiser-git
pkgver=0.8.1r1129.dcaf849
pkgrel=1
pkgdesc="Emacs environment to hack in Scheme, version from git"
arch=('any')
url=http://www.nongnu.org/geiser/
license=('custom:BSD')
depends=('bash' 'emacs')
makedepends=('git')
provides=('geiser')
conflicts=('geiser')
install=geiser.install
source=("git+https://github.com/jaor/geiser.git")
_gitname="geiser"
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "$_gitname"
  printf "%sr%s.%s" $(awk -F[ '/AC_INIT/ {print $3}' configure.ac|tr -d ],) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --with-lispdir='${datadir}/emacs/site-lisp/geiser'
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING
}
