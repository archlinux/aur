# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-readonly'
_edition=' Readonly'
pkgname="$_pkgname-bin"
_pkgver='1.45.1'
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
b2sums=('debe8649c0f5dcda7645143b9b463a0c9e477d49320b3a20a8b8e130467a0781a13e30a668d0b6c56c0f0c358aec440e06c9c9c09268f7470f00a8f81f418080'
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
