# Maintainer: Pavel Minaev <int19h@gmail.com>
pkgname=kiwix-cli-git
pkgver=0.0.0
pkgrel=2
pkgdesc="Offline reader for Web content. It's especially intended to make Wikipedia available offline."
arch=('i686' 'x86_64')
url="http://www.kiwix.org"
license=('GPL3')
groups=()
depends=('zimlib-git' 'xapian-core' 'libmicrohttpd' 'pugixml' 'ctpp2' 'icu')
makedepends=('git' 'aria2' 'zip' 'python' 'cmake')
provides=('kiwix')
conflicts=('kiwix' 'kiwix-bin')
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/kiwix/kiwix.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	
	# Makefile will try to install icons, desktop entries etc for the Kiwix reader,
	# even though it's not built. This will prevent that.
	sed -i '/\tdesktop \\/d' Makefile.am
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --enable-indexer --enable-searcher --disable-components --disable-launcher --disable-installer HAVE_UPX=0
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

	# Makefile "installs" some things that are specifically disabled in the build,
	# including symlinks to missing binaries. Clean that up.
	rm -rf "$pkgdir/usr/lib"
	rm -rf "$pkgdir/usr/share/kiwix"
}
