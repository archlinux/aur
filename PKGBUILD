# Maintainer: somini <dev@somini.xyz>
# Contributor: Teyras <Teyras@gmail.com>
pkgname=purple-hangouts-git
pkgbase=purple-hangouts
pkgdesc="A Pidgin plugin to support the proprietary protocol used by Google for the Hangouts service"
url='https://github.com/EionRobb/purple-hangouts'
arch=('i686' 'x86_64' 'armv6h')
pkgver=latest
pkgrel=1
license=('GPLv3+')
provides=("$pkgbase")
conflicts=('purple-hangouts-hg')
depends=('libpurple' 'glib2' 'json-glib' 'protobuf-c')
makedepends=('git')
source=('purple-hangouts::git+https://github.com/EionRobb/purple-hangouts.git')
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgbase"
	make
}

package() {
	cd "$srcdir/$pkgbase"
	destdir="$pkgdir$(pkg-config --variable plugindir purple)"
	install -Dm755 -t "$destdir" libhangouts.so

	icondir="$pkgdir/usr/share/pixmaps/pidgin/protocols"
	echo "Icon Dir: $icondir"

	for size in 16 22 24 48; do
		install -TDm644 $srcdir/$pkgbase/hangouts$size.png $icondir/$size/hangouts.png
	done
}
