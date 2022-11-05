# Contributor: Yamada Hayao <hayao@fascode.net>
# Maintainer: Matrix <thysupremematrix a_t tuta d_o_t io>

_extname='desktop-icons-ng'
pkgname="gnome-shell-extension-desktop-icons-ng"
pkgver="47"
pkgrel=2
pkgdesc="A fork from the official desktop icons project, with several enhancements like Drag'n'Drop."
arch=('x86_64' 'i686')
url="https://gitlab.com/rastersoft/desktop-icons-ng/"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson' 'glib2')
conflicts=("$pkgname-git")
source=("$_extname-$pkgver.tar.gz::https://gitlab.com/rastersoft/$_extname/-/archive/$pkgver/$_extname-$pkgver.tar.gz")
sha512sums=('a52131e89b54a7d7400bb0269403dbee7e5173347863721f8191a0e3b6fde7bdc3f83ee8bd71b132191e170566e237704645bb71ef3cd748a350ab60f09deb33')



build() {
	cd $srcdir/$_extname-$pkgver/	
	_uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	
	DESTDIR="$pkgdir/usr" meson --prefix="$srcdir/$_extname-$pkgver/$_uuid" --localedir=locale "build" "."
	cd build
	meson install
}

package() {
	cd $srcdir/$_extname-$pkgver/
	_uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
	
	install -dm755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	cd $srcdir/$_extname-$pkgver/$_uuid
	cp -dpr --no-preserve=ownership ./* "${pkgdir}/usr/"
	mv $pkgdir/usr/locale $pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale
	rm $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled
}
