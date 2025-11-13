# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-readonly-beta'
_edition=' Readonly Beta'
pkgname="$_pkgname-bin"
_pkgver='1.48.2-beta.2'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition - beta version - binary version'
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
backup=('etc/mongodb-compass.conf')
_betaprefix="$([[ "$_pkgname" =~ -beta$ ]] && printf 'beta/' || printf '')"
source=(
	"$pkgname-$pkgver.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm"
	'mongodb-compass.conf'
)
b2sums=('c6164c19fc817dcf28450cdcaeb9cde2fcc70780efa7d8698a498d5ec03de793ef844ebf8ba60d138bda887b3b4352578df946777dfc809f93e0f1a7592919f8'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

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

	install -Dm644 "$srcdir/mongodb-compass.conf" "$pkgdir/etc/mongodb-compass.conf"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"

	ln -sf "/usr/lib/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	ln -sf "/usr/lib/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
