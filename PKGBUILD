# Maintainer: Łukasz Mariański <lmarianski at protonmail dot com>
_electron=electron22
pkgname=itch-bin
_pkgname="${pkgname%-bin}"
_pkgver=26.0.2-canary
pkgver=26.0.2
pkgrel=1
pkgdesc="The best way to play your itch.io games"
arch=('any')
url="https://github.com/itchio/itch"
license=('MIT')
depends=("$_electron" 'libnotify' 'nss' 'libxss' 'gtk3')
#makedepends=('unzip')
optdepends=('firejail: Application sandbox')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=(
	"$_pkgname-$pkgver.zip::https://broth.itch.ovh/k$_pkgname/linux-amd64/$pkgver/archive/default"
	"$_pkgname-$pkgver-src.tar.gz::https://github.com/itchio/itch/archive/refs/tags/v$_pkgver.tar.gz"
	"$_pkgname.sh"
	"io.itch.$_pkgname.desktop"
)
sha256sums=('04ab534f42e21892d3e978e9ad1ab704a8b00d41a82205aed6ad31e492fe422f'
            'aaf25e5400a77be2034fe4409d4cc76be6ab36dce7cd9ad9814e1c0eb779daf6'
            'c02249d9d15f57e74aef6f2e1fd26837a6f5950af4a63fb5810c759880bfa58e'
            '9c5a5fcbd03e6d2e5dd15b39f4c1f93a57ab341ef947d287acef47386044ecd1')
noextract=("$_pkgname-$pkgver-src.tar.gz")


prepare() {
#	unzip -o -qq "$_pkgname-$pkgver.zip" -d "$_pkgname-$pkgver"

	mkdir -p "$srcdir/icons/"
	tar --wildcards -zxf "$_pkgname-$pkgver-src.tar.gz" "$_pkgname-$_pkgver/release/images/itch-icons/icon*.png"
}

package() {
	cd "$srcdir"

	install -d "$pkgdir/usr/share/$_pkgname/"
	cp -r resources/app/** "$pkgdir/usr/share/$_pkgname/"

	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

 	install -Dm644 "$srcdir/io.itch.$_pkgname.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 LICENSES.chromium.html -t "$pkgdir/usr/share/licenses/$pkgname/"

	for icon in "$srcdir/$_pkgname-$_pkgver/release/images/itch-icons/icon"*.png
	do
		iconsize="${icon#release/images/itch-icons/icon}"
		iconsize="${iconsize%.png}"
		icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
		install -d "${icondir}"
		install -Dm644 "$icon" "$icondir/$_pkgname.png"
	done
}
