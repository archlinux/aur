# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-beta'
_edition=' Beta'
pkgname="$_pkgname-bin"
_pkgver='1.35.1-beta.3'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - beta version - binary version'
arch=('x86_64')
url='https://www.mongodb.com/products/compass'
license=('custom:SSPL')
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
source=("$pkgname-$pkgver-$pkgrel.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm")
sha512sums=('a3b050c9c5e5897c78c3d2f518fef4d0ae030ec901a6c5c10e83a87e10fd5f12d4cc68eb0ba76d216c75fd93294c9fd5ea922184f88682bf17afdfd2dafc9d01')

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
	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		ln -sf "/opt/$_pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
