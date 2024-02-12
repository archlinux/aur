# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-readonly'
_edition=' Readonly'
pkgname="$_pkgname-bin"
_pkgver='1.42.0'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition - binary version'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('SSPL-1.0')
depends=(
	# electron
	'c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2' 'snappy'
	# compass
	'krb5' 'libsecret' 'lsb-release'
)
optdepends=('org.freedesktop.secrets')
provides=("$_pkgname")
conflicts=("$_pkgname")
_betaprefix="$([[ "$_pkgname" =~ -beta$ ]] && printf 'beta/' || printf '')"
source=("$pkgname-$pkgver.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm")
sha512sums=('061c1687a0904b9d85b67130047dcbbe8e10cf10543e8f45d5750f0a54cdd269d256e306ac93865bc77d3c99f095596e49d9208f2d8fd383e648c88885f75dd6')

package() {
	cd "$srcdir/"

	install -dm755 "$pkgdir/opt/"
	cp -r --no-preserve=ownership --preserve=mode "usr/lib/$_pkgname/" "$pkgdir/opt/$_pkgname/"

	chmod u+s "$pkgdir/opt/$_pkgname/chrome-sandbox"

	install -dm755 "$pkgdir/usr/bin/"
	ln -sf "/opt/$_pkgname/MongoDB Compass$_edition" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/pixmaps/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"

	ln -sf "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/SSPL-1.0"
	ln -sf "/opt/$_pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
