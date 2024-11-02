# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-isolated'
_edition=' Isolated Edition'
pkgname="$_pkgname-bin"
_pkgver='1.44.6'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition - binary version'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
depends=(
	# electron
	'c-ares' 'dav1d' 'flac' 'fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'gtk3'
	'harfbuzz' 'icu' 'libdrm' 'libevent' 'libffi' 'libjpeg' 'libpng' 'libpulse'
	'libwebp' 'libxml2' 'libxslt' 'minizip' 'nss' 'opus' 'zlib'
	# compass
	'krb5' 'libsecret' 'lsb-release'
)
optdepends=('org.freedesktop.secrets')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/mongodb-compass.conf')
_betaprefix="$([[ "$_pkgname" =~ -beta$ ]] && printf 'beta/' || printf '')"
source=(
	"$pkgname-$pkgver.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm"
	'mongodb-compass.conf'
)
b2sums=('0109a4c0b45c201407431648c2c1f603f5b5714122a957bdaad418e650b20a79b23ed133e35b22f6e2f26d39d691af03cfd478eda48f8824a953105ee207e47e'
        '42535bfc10db335d685fad29aade1d091554a321fb4032b72db5699a450c6d701f630c45bb0d4cf9f456e77e3263a5aed49e843516cd3016d1a837ac5f1e6fec')

check() {
	_checkoutput="$(ELECTRON_OZONE_PLATFORM_HINT='auto' "$srcdir/usr/lib/$_pkgname/MongoDB Compass$_edition" --no-sandbox --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^MongoDB Compass$_edition $pkgver$"
}

package() {
	cd "$srcdir/"

	install -dm755 "$pkgdir/opt/"
	cp -r --no-preserve=ownership --preserve=mode "usr/lib/$_pkgname/" "$pkgdir/opt/$_pkgname/"

	chmod u+s "$pkgdir/opt/$_pkgname/chrome-sandbox"

	install -dm755 "$pkgdir/usr/bin/"
	ln -sf "/opt/$_pkgname/MongoDB Compass$_edition" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "$srcdir/mongodb-compass.conf" "$pkgdir/etc/mongodb-compass.conf"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"

	ln -sf "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	ln -sf "/opt/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
