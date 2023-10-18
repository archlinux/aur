# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='mongodb-compass-readonly'
_edition=' Readonly'
pkgname="$_pkgname-bin"
_pkgver='1.40.4'
pkgver="$(printf '%s' "$_pkgver" | tr '-' '.')"
pkgrel='1'
pkgdesc='The official GUI for MongoDB - Readonly Edition - binary version'
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
source=("$pkgname-$pkgver.rpm::https://downloads.mongodb.com/compass/$_betaprefix$_pkgname-$_pkgver.x86_64.rpm")
sha512sums=('ec151f973015211d497830fea184c0ac4f58ded5972619b610d4fb50304bc3b8699a0bfc332981b6ee8b7fac4df702a1ab30bd72a1a093f7d1c11d029f8173ef')

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
