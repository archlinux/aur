# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>
_pkgname='ferdi'
pkgname="$_pkgname-bin"
pkgver='5.4.3'
pkgrel='2'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application - binary version'
arch=('x86_64')
url="https://get$_pkgname.com"
license=('Apache')
depends=('alsa-lib' 'c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2' 'libsecret' 'libxkbfile' 'libxslt' 'libxss' 'libxtst' 'minizip' 'nss' 're2' 'snappy')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver-$pkgrel.rpm::https://github.com/get$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.x86_64.rpm")
sha256sums=('7f4c7dabc4ef25d8c9d972754484857256585738a4fff54957dd5cafb212dbf0')

prepare() {
	sed -E -i -e "s|Exec=/opt/${_pkgname^}/$_pkgname|Exec=/usr/bin/$_pkgname|" "$srcdir/usr/share/applications/$_pkgname.desktop"
}

package() {
	cd "$srcdir/"

	install -dm755 "$pkgdir/opt/"
	cp -r --no-preserve=ownership --preserve=mode "opt/${_pkgname^}/" "$pkgdir/opt/$_pkgname/"

	install -dm755 "$pkgdir/usr/bin/"
	ln -sf "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE.electron.txt' 'LICENSES.chromium.html'; do
		ln -sf "/opt/$_pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
