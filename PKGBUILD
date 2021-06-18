# Maintainer: hamki <hamki.do2000@gmail.com>
_gituser="magit"
_gitrepo="libegit2"

pkgname=emacs-libegit2-git
pkgver=r462.2e19b7c
pkgrel=1
pkgdesc="A set of keybindings for evil-mode"
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
depends=('emacs')
makedepends=('cmake')
provides=('emacs-libegit2')
conflicts=('emacs-libegit2')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitrepo"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitrepo"
emacs -q --no-splash -batch -L . --eval '(setq byte-compile-error-on-warn t )' -f batch-byte-compile libgit.el
git submodule init
git submodule update
mkdir -p build
cd build
cmake ..
make
}

package() {

cd "$_gitrepo"
  install -d  "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  install -m644 libgit.el{c,} "$pkgdir"/usr/share/emacs/site-lisp/${_gitrepo}/
  cd build
make DESTDIR="$pkgdir/" install
}
