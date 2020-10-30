# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=gnome-schedule-git
pkgver=2.3.0.r18.09b92ea
pkgrel=1
pkgdesc="Graphical interface to crontab and at for GNOME"
arch=('any')
url="http://gnome-schedule.sourceforge.net"
license=('GPL')
depends=('at' 'cronie' 'python')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/GNOME/${pkgname%-git}.git"
        "gnome-doc-utils.patch")
md5sums=('SKIP'
         '13b96f3715fb7b56bfbb366f79349311')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's|^RELEASE\.||')"
}

prepare() {
    cd "$srcdir"
    patch --forward --strip=1 --input="../gnome-doc-utils.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	[ ! -f README ] && touch README
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
