# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=xournal-git
pkgver=20120913
pkgrel=1
pkgdesc="Notetaking and sketching application"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xournal/"
license=('GPL')
depends=('libgnomecanvas>=2.30.1' 'shared-mime-info' 'poppler-glib>=0.14.0'
         'hicolor-icon-theme' 'desktop-file-utils' 'gtk2')
makedepends=('git' 'gettext')
optdepends=('ghostscript: import PS/PDF files as bitmap backgrounds')
provides=('xournal')
conflicts=('xournal' 'xournal-image-patched' 'xournalpp-svn')
install=xournal.install

_gitroot=git://xournal.git.sourceforge.net/gitroot/xournal/xournal
_gitname=xournal

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

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install desktop-install
}

# vim:set ts=2 sw=2 et:
