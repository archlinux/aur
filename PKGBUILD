# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-readonly'
_edition=' Readonly'
pkgname="$_pkgname-bin"
_pkgver='1.49.2'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition - binary version'
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
b2sums=('0d2c10a1f7ac7bc4188d5cfe8defea5ae4321b78c55cd1a8f20b1ee7809f3f70b8e72865333daa13ab0284c4dc2c45ff613f9157811ba903718540c416bcb023')

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
