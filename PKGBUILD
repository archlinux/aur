# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=macaon-git
pkgver=20130219
pkgrel=2
pkgdesc="natural language processing (NLP) toolchain that can work word lattices."
arch=(i686 x86_64)
url="http://macaon.lif.univ-mrs.fr/"
license=('GPL')
depends=('glib2' 'libxml2' 'gfsm>=0.0.10')
makedepends=('git' 'pkg-config')

_gitroot=git.lif.univ-mrs.fr/git/public/macaon
_gitname=macaon

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone https://"$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
