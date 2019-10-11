# Maintainer: David Stearns <David@DavidStearns.us>
# Contributor: Simon Tunnat <simon+aur@tunn.at>
# Contributor: anekos <anekos@snca.net>
pkgname=growl-for-linux-git
pkgver=r4.edac6d9
pkgrel=1
pkgdesc="Growl for Linux - git release"
url="http://mattn.github.com/growl-for-linux/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('git' 'openssl' 'curl' 'gtk2' 'sqlite3' 'dbus-glib' 'desktop-file-utils')
optdepends=('libnotify')
makedepends=()
conflicts=('growl-for-linux')
replaces=()
backup=()
options=('!libtool')


source=("growl-for-linux-git::git+https://github.com/mattn/growl-for-linux.git#branch=master")
md5sums=('SKIP')
_dirname="growl-for-linux-git"

pkgver() {
	cd "$_pkgbase"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
  cd "$srcdir/$_dirname"

  export LDFLAGS="$LDFLAGS -lgmodule-2.0 -lgthread-2.0"
  export LIBNOTIFY_LIBS="-lnotify"
  ./autogen.sh
  ./configure --prefix=/usr && make
}

package () {
  cd "$srcdir/$_dirname"
  echo $PWD
  make install DESTDIR="$pkgdir" prefix=/usr
}

# vim:set ts=2 sw=2 et:
