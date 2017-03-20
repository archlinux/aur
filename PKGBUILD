# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>

pkgname=libsoc-git
pkgver=0.8.2.r17.g5b788d4
pkgrel=1
pkgdesc="libsoc is a C library to interface with common peripherals found in System on Chips (SoC) through generic Linux Kernel interfaces."
arch=('any')
url="https://github.com/jackmitch/libsoc"
license=('GPL')
makedepends=('git' 'autoconf')
source=(git://github.com/jackmitch/libsoc.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/libsoc"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
  cd "$srcdir/libsoc"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libsoc"
  make DESTDIR="$pkgdir/" install
}
