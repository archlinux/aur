# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=qtscrcpy
_pkgname=QtScrcpy
pkgver=1.6.0
pkgrel=1
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('qt5-x11extras' 'android-tools')
conflicts=('qt-scrcpy')
replaces=('qt-scrcpy')
backup=("etc/$pkgname/config.ini")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'path-fix.patch'
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('d29fbae6f52c457baf624e540353f7ad00e22aa7ce86866059c485c0be8a5ad8'
            '19a9dae14c041715ee96cb6357c9f46ff7a9c5342f7e0d798bb17d6244347bfe'
            '0dc5b08698162c8a0172a9c2e92b18fa7cd9df4b295bd350329b1e4dbd892a6e'
            '26335d1e208c47ddfc4abaabce3f32734788a80a6663577b3ff462346d8dec6f')

prepare() {
	cd "$_pkgname-$pkgver/$_pkgname"
	patch < "$srcdir/path-fix.patch"
}

build() {
	cd "$_pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 output/linux/release/QtScrcpy -t "$pkgdir/opt/$pkgname"
	install -Dm644 backup/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 config/config.ini -t "$pkgdir/etc/$pkgname"
	install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname"
	cp -r keymap "$pkgdir/opt/$pkgname"
	chmod 666 "$pkgdir/opt/$pkgname/keymap"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 third_party/scrcpy-server -t "$pkgdir/opt/$pkgname"
}
