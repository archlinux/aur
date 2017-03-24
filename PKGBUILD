# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=guile4emacs-git
_gitname="guile"
pkgver=r17564.15ca78482
pkgrel=2
pkgdesc="patched version of guile for guile-emacs"
arch=('i686' 'x86_64')
url="http://www.emacswiki.org/emacs/GuileEmacs"
license=('GPL')
depends=('gmp' 'gc' 'bash' 'libffi' 'libunistring' 'libltdl')
makedepends=('git' 'clang' 'openmp')
conflicts=('guile-git')
provides=('guile-git')
options=('!strip' '!makeflags')
source=("git://git.sv.gnu.org/$_gitname.git#branch=wip-elisp")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  CC=clang ./configure --prefix=/usr --disable-error-on-warning \
	--program-suffix=4emacs
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/info
  for i in guile*
  do
    mv $i guile-4emacs${i#guile}
  done
  mv r5rs.info r5rs-4emacs.info
   mv $pkgdir/usr/share/aclocal/guile.m4 $pkgdir/usr/share/aclocal/guile-4emacs.m4
  rm $pkgdir/usr/lib/libguile*.scm
}
