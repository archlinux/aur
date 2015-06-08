# Contributor: Richard Murri <admin@richardmurri.com> (snapshot version)
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-dvc-bzr
pkgver=591
pkgrel=4
pkgdesc="Common Emacs front-end for a number of distributed version control systems (currently arch, bazaar, git, mercurial, monotone)"
arch=('any')
url="http://download.gna.org/dvc/"
license=('GPL')
depends=('emacs')
makedepends=('bzr' 'texinfo')
provides=('emacs-dvc')
install=dvc.install
source=('bzr+http://bzr.xsteve.at/dvc/' 'texinfo5.patch')
md5sums=('SKIP' 'ef3ee57d78d07b271d40b2098c564344')
_bzrmod=dvc

pkgver() {
  cd "$srcdir"/dvc
  bzr revno
}
prepare() {
  cd "$srcdir"/dvc
  patch -p2 < $srcdir/texinfo5.patch
}

build() {
  cd $srcdir/dvc
  autoconf
  ./configure --prefix="$pkgdir"/usr 
  find . -type d -exec sed -i 's+@MKDIR_P@+install+g' {}/Makefile \;
  make
}

package() {
  cd "$srcdir"/dvc
  install -Dm644 texinfo/dvc.info $pkgdir/usr/share/info/dvc.info
  install -Dm644 texinfo/dvc-intro.info $pkgdir/usr/share/info/dvc-intro.info
  install -d $pkgdir/usr/share/emacs/site-lisp/dvc
  cp lisp/*.{el,elc} $pkgdir/usr/share/emacs/site-lisp/dvc
  install -d $pkgdir/usr/share/doc/emacs-dvc
  cp -r docs/* $pkgdir/usr/share/doc/emacs-dvc
}
