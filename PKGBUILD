# Maintainer:  Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=jpilot
pkgver=2.0.1
pkgrel=2
pkgdesc="A desktop organizer application for the Palm Pilot"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/juddmon/jpilot/"
license=('GPL2')
depends=('openssl' 'gtk3' 'pilot-link' 'slang')
makedepends=('intltool')
source=("https://codeload.github.com/juddmon/jpilot/legacy.tar.gz/ba8354f"
	"https://raw.githubusercontent.com/eklausme/c/e637065e25e6a855dfac91ddf9683f5123ae612f/jpsqlite.c"
	"https://raw.githubusercontent.com/eklausme/c/0c35d9a6b9097890e8af24ecd8956ed24da61e13/jptables.sql")
sha256sums=('db88cd8ec06c7a847ca91fcb6015c2086ad1063316b7017f4a9de3668efc4aa9'
            'e99be953dab21d248322b35dc895089593d1272f2e0b9af83d5cb6762c7ec3e0'
            '01d8b6c47c365958b60f841fd96e82af661b9011090b3bde25e8ea90802e8a44')

build() {
	cd "${srcdir}"/juddmon-$pkgname-ba8354f

	./autogen.sh --prefix=/usr --disable-pl-test --disable-gtktest
	make

	# Compile SQLite3 plugin
	mv ../../jpsqlite.c .
	cc `pkg-config -cflags-only-I gtk+-3.0` -I ./ -s -fPIC -shared jpsqlite.c -o libjpsqlite.so
}

package() {
	cd "${srcdir}"/juddmon-$pkgname-ba8354f

	make DESTDIR="${pkgdir}" install

	# Install SQLite3 plugin
	cp libjpsqlite.so "${pkgdir}"/usr/lib/jpilot/plugins
	cp ../jptables.sql "${pkgdir}"/usr/lib/jpilot/plugins

	install -d "${pkgdir}"/usr/share/pixmaps
	cd "${pkgdir}"/usr/share/pixmaps
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot-icon1.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon2.xpm jpilot-icon2.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon3.xpm jpilot-icon3.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon4.xpm jpilot-icon4.xpm
	ln -s /usr/share/doc/jpilot/icons/jpilot-icon1.xpm jpilot.xpm
}

