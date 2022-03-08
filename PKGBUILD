# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
pkgname=itch-bin
_pkgname="${pkgname%-bin}"
pkgver=25.5.1
pkgrel=2
epoch=
pkgdesc="The best way to play your itch.io games"
arch=('any')
url="https://github.com/itchio/itch"
license=('MIT')
depends=('electron11' 'libnotify' 'nss' 'libxss' 'gtk3')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=(
	"$_pkgname-$pkgver.zip::https://broth.itch.ovh/$_pkgname/linux-amd64/$pkgver/archive/default"
	"$_pkgname-$pkgver-src.tar.gz::https://github.com/itchio/itch/archive/v$pkgver.tar.gz"
	"$_pkgname.sh"
	"io.itch.$_pkgname.desktop"
	"$_pkgname.patch"
)
sha256sums=('fdd916c79beb90c19c7ee404e11398e5f2f5c7c402ae68910b4f70e6918071ed'
            '0a7094bff90992e3788fd9f9df43a4a3c9233bfcf0f5da037e59af6b365a3249'
            '734863afafacbc599235bdc5f66f29f80a7a544b4c733fb1ab8adaad50bd8465'
            '9c5a5fcbd03e6d2e5dd15b39f4c1f93a57ab341ef947d287acef47386044ecd1'
            '8262cbfc13289dd49f944466d33f83b860cfe7a2610d78b2c44c0b51abd30fc4')
noextract=("$_pkgname-$pkgver.zip" "$_pkgname-$pkgver-src.tar.gz")


prepare() {
	unzip -o -qq "$_pkgname-$pkgver.zip" -d "$_pkgname-$pkgver"

	mkdir -p "$srcdir/icons/"
	tar --wildcards -zxf "$_pkgname-$pkgver-src.tar.gz" "$_pkgname-$pkgver/release/images/itch-icons/icon*.png"

	cd "$_pkgname-$pkgver"

	patch -p1 -i "$srcdir/$_pkgname.patch"
}

package() {
	cd "$_pkgname-$pkgver"

	install -d "$pkgdir/usr/share/$_pkgname/"
	cp -r resources/app/** "$pkgdir/usr/share/$_pkgname/"

	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

 	install -Dm644 "$srcdir/io.itch.$_pkgname.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname/"

	for icon in release/images/itch-icons/icon*.png
	do
		iconsize="${icon#release/images/itch-icons/icon}"
		iconsize="${iconsize%.png}"
		icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
		install -d "${icondir}"
		install -Dm644 "$icon" "$icondir/$_pkgname.png"
	done
}
