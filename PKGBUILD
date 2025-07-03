# Maintainer: Zhao Jun <wlarekap32 cat protonmail dog com>
# Contributor: <tplasdio cat codeberg dog org>

pkgname=gawk-libc-git
_pkgname=gawk-libc
pkgdesc="C standard library bindings for gawk"
pkgver=0
pkgrel=1
license=('GPL-3.0-or-later')
url='https://codeberg.org/tplasdio/gawk-libc'
depends=(
 gawk
 glibc
 libxcrypt
)
makedepends=(
 git
 automake
 autoconf
 make
)
arch=(any)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd -- "$_pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --abbrev=0 --tags | tr -d v)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd -- "$_pkgname"
	autoreconf -i
	./configure --prefix /usr
	make CPPFLAGS='-D_GNU_SOURCE'
}

package() {
	cd -- "$_pkgname"
	# there's already an homonymous first-party fnmatch
	make PREFIX_LIBS=fnmatch DESTDIR="$pkgdir" install
}
