# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-beta'
_edition=' Beta'
pkgname="$_pkgname-bin"
_pkgver='1.49.4-beta.1'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - beta version - binary version'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
depends=(
	# electron
	'c-ares' 'dav1d' 'flac' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'gtk3'
	'harfbuzz' 'icu' 'libdrm' 'libevent' 'libffi' 'libjpeg' 'libpng' 'libpulse'
	'libwebp' 'libxml2' 'libxslt' 'minizip' 'nss' 'opus' 'zlib'
	# compass
	'krb5' 'libsecret'
)
optdepends=('org.freedesktop.secrets')
options=('!debug')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
_betaprefix="$([[ "$_pkgname" =~ -beta$ ]] && printf 'beta/' || printf '')"
source=(
	"$pkgname-$pkgver.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm"
)
b2sums=('cca99ebc5239b5927a8377230c6c47a64c7f95e61cf49a26b88e32fca4051719f2f974386a1ba6e10d1b240761f95531fdb0e52e3d6467ec40dd2417e90159b0')

check() {
	_checkoutput="$(ELECTRON_OZONE_PLATFORM_HINT='auto' "$srcdir/usr/lib/$_pkgname/MongoDB Compass$_edition" --no-sandbox --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^MongoDB Compass$_edition $pkgver$"
}

package() {
	cd "$srcdir/"

	install -dm755 "$pkgdir/usr/lib/"
	cp -r "usr/lib/$_pkgname/" "$pkgdir/usr/lib/$_pkgname/"

	# Fix permissions
	find "$pkgdir" -type d -exec chmod 755 {} +
	find "$pkgdir" -type f -exec chmod 644 {} +
	chmod +x "$pkgdir/usr/lib/$_pkgname/chrome_crashpad_handler"
	chmod +x "$pkgdir/usr/lib/$_pkgname/chrome-sandbox"
	chmod +x "$pkgdir/usr/lib/$_pkgname/MongoDB Compass$_edition"

	install -dm755 "$pkgdir/usr/bin/"
	ln -sf "/usr/lib/$_pkgname/MongoDB Compass$_edition" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"

	ln -sf "/usr/lib/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	ln -sf "/usr/lib/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
