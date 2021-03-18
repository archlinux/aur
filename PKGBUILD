# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daenyth <Daenyth+Arch at gmail dot com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>
# Contributor: slubman <slubman@slubman.net>

_pkgbase=iftop
pkgname=${_pkgbase}-git
pkgver=r286.77901c8
pkgrel=1
pkgdesc="Display bandwidth usage on an interface - git version"
arch=('x86_64')
url="http://www.ex-parrot.com/~pdw/iftop/"
license=('GPL')
depends=('libpcap' 'ncurses')
provides=('iftop')
conflicts=('iftop')
source=("git+https://code.blinkace.com/pdw/iftop.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgbase}"

  autoheader
  aclocal
  automake --add-missing
  autoupdate
  autoconf
}

build() {
  cd "${_pkgbase}"

  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common

  ./configure --prefix=/usr --sbindir=/usr/bin --mandir=/usr/share/man
  make
}

package() {
  cd "${_pkgbase}"

  make DESTDIR="$pkgdir" install
}

