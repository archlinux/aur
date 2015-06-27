# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
pkgname=emacs-dart-mode-git
pkgver=0.13.r5.gbf82220
pkgrel=1
pkgdesc="Major mode for Dart"
arch=("any")
url="https://github.com/nex3/dart-mode"
license=('GPL')
groups=()
depends=("emacs" "emacs-dash" "flycheck")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()

_gitroot=https://github.com/nex3/dart-mode.git
_gitname=dart-mode

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
      cd "$_gitname" && git pull origin
      msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  emacs -batch -q -f batch-byte-compile dart-mode.el
}

package() {
  cd "$srcdir/$_gitname-build"
  install -d $pkgdir/usr/share/emacs/site-lisp
  install -Dm644 dart-mode.{el,elc} $pkgdir/usr/share/emacs/site-lisp
}
