# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=qtscrcpy
_pkgname=QtScrcpy
pkgver=1.5.0
_scrcpyver=1.17
pkgrel=2
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('qt5-x11extras' 'android-tools')
conflicts=('qt-scrcpy')
replaces=('qt-scrcpy')
backup=("etc/$pkgname/config.ini")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "https://github.com/Genymobile/scrcpy/releases/download/v$_scrcpyver/scrcpy-server-v$_scrcpyver"
        'path-fix.patch'
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('fb9d538ad18a0971a68f9842a4968055a7654e1e6f761557d408f4eaa4f0dc0f'
            '11b5ad2d1bc9b9730fb7254a78efd71a8ff46b1938ff468e47a21b653a1b6725'
            '19a9dae14c041715ee96cb6357c9f46ff7a9c5342f7e0d798bb17d6244347bfe'
            '0dc5b08698162c8a0172a9c2e92b18fa7cd9df4b295bd350329b1e4dbd892a6e'
            '26335d1e208c47ddfc4abaabce3f32734788a80a6663577b3ff462346d8dec6f')

prepare() {
	cd "$_pkgname-$pkgver/$_pkgname"
	patch < "$srcdir/path-fix.patch"
}

build() {
	cd "$_pkgname-$pkgver"
	qmake CONFIG+=$CARCH CONFIG+=qtquickcompiler
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
	install -Dm644 "$srcdir/scrcpy-server-v$_scrcpyver" "$pkgdir/opt/$pkgname/scrcpy-server"
}
