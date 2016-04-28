# Maintainer: Darshit Shah <darnir@gmail.com>

_gitname=wget2
pkgname=${_gitname}-git
pkgver=0.0.r686.gbc38566
pkgrel=1
pkgdesc="Updated version of popular Wget tool"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/wget/wget.html"
license=('GPL3')
depends=('libutil-linux' 'gnutls' 'libidn' 'libpsl' 'gpgme')
optdepends=("ca-certificates: HTTPS Downloads")
makedepends=('git' 'rsync')
provides=('wget2')
conflicts=('wget2')
source=("git://git.savannah.gnu.org/wget/${_gitname}.git"
        "git://git.savannah.gnu.org/gnulib.git")
md5sums=('SKIP' 'SKIP')

build() {
  cd $_gitname
  git submodule init
  git config submodule.gnulib.url "$srcdir/gnulib"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd $_gitname
  #Use the tag from the last commit.
  # XXX: Hack for a decent version number till the first version is tagged
  git tag v0.0 e0452bc || true
  git describe --always --tags --long | sed 's/^v//; s/-/.r/; s/-/./g'
}

check() {
  cd $_gitname
  make check
  make clean
}

# vim:set ts=2 sw=2 tw=0 et:
