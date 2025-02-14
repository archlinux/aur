# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-isolated-beta'
_edition=' Isolated Edition Beta'
pkgname="$_pkgname-bin"
_pkgver='1.45.3-beta.4'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Isolated Edition - beta version - binary version'
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
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/mongodb-compass.conf')
_betaprefix="$([[ "$_pkgname" =~ -beta$ ]] && printf 'beta/' || printf '')"
source=(
	"$pkgname-$pkgver.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm"
	'mongodb-compass.conf'
)
b2sums=('c2285809f7ee865a44b8cd5d75c1eb20e93f38b59da9c028e7a7c11b9c63b97de676301b73758af6b1ef3a081f3bc9f012156c2bfb18e870902946e346f063c0'
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
