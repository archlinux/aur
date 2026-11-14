# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Petr Malat <petris@penguin.cz>

pkgname='tong'
pkgver='1.3.1'
pkgrel='1'
pkgdesc="Tetris meets Pong, with more twists than a contortionist club's secret handshake"
arch=('i686' 'x86_64')
url="https://tong.nongnu.org/"
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'sdl12-compat' 'sdl_image' 'sdl_mixer')
source=("https://tong.nongnu.org/$pkgname-$pkgver.tar.gz"
	"$pkgname.desktop")
sha256sums=('a3330fd13802a74c99a6362498cc9da2a9ca148b23134196e18ceb6f6ef06323'
	'601f3fa958bd6beb692b3e3d0e9e8bd57daff098f6ad9aaed7494a74008ab841')

build() {
	cd "$srcdir/$pkgname"
	# The upstream Makefile puts the libraries before the objects on the link
	# line, so --as-needed (from LDFLAGS) would drop them: disable it again.
	make CC="g++ $CXXFLAGS $LDFLAGS -Wl,--no-as-needed" GAME_DATA_DIR="/usr/share/$pkgname"
}

package() {
	# Copy files and binary on appropriate destinations
	cd "$srcdir/$pkgname"
	install -d "$pkgdir/usr/share/$pkgname"
	cp -r media "$pkgdir/usr/share/$pkgname/"
	install -m644 CREDITS "$pkgdir/usr/share/$pkgname/CREDITS"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	# Remove unneeded folders
	rm -r "$pkgdir/usr/share/$pkgname/media/"{gp2x,wii}

	# Install the icon and the desktop entry
	install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
