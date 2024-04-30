# Maintainer: Darshit Shah <aur_honeypot@contact.darnir.net>

_gitname=wget2
pkgname=${_gitname}-git
pkgver=v2.1.0.r81.gbb3199fd
pkgrel=1
pkgdesc="Updated version of popular Wget tool"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/wget/wget.html"
license=('GPL-3.0-or-later')
depends=('libutil-linux' 'gnutls' 'libidn2' 'libpsl' 'gpgme' 'nghttp2' 'lzip')
checkdepends=('libmicrohttpd')
optdepends=("ca-certificates: HTTPS Downloads")
makedepends=('git' 'rsync' 'gperf' 'python' 'wget' 'pandoc' 'doxygen')
provides=('wget2')
conflicts=('wget2')
source=("git+https://gitlab.com/gnuwget/wget2.git"
        "git+https://git.savannah.gnu.org/git/gnulib.git/")
md5sums=('SKIP'
         'SKIP')

build() {
  cd $_gitname
  export GNULIB_SRCDIR="$srcdir/gnulib"
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install

  # This is no longer needed once the installation is done
  rm -f "$pkgdir/usr/bin/wget2_noinstall"
}

pkgver() {
  cd $_gitname
  #Use the tag from the last commit.
  # git describe --always --tags --long | sed 's/^v//; s/-/.r/; s/-/./g; s/wget2.//g'
  git describe --tags --long | cut -f6- | sed 's/wget2-//g; s/-/.r/; s/-/./g'
}

check() {
  cd $_gitname
  make check
}

# vim:set ts=2 sw=2 tw=0 et:
