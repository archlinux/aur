# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>
_pkgname='ferdi'
pkgname="$_pkgname-bin"
pkgver='5.7.0'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application - binary version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://get$_pkgname.com"
license=('Apache')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
provides=("$_pkgname")
conflicts=("$_pkgname")
_releaseurl="https://github.com/get$_pkgname/$_pkgname/releases/download/v$pkgver/ferdi_$pkgver"
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.zip::${_releaseurl}_amd64.deb")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.zip::${_releaseurl}_armv7l.deb")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.zip::${_releaseurl}_arm64.deb")
sha512sums_x86_64=('382aaf5f15bf65a9b1c6848509294bed8a2eaa0dc51f3ee32f2b11fb74b7b1ad767be074dd49b878bf849a13a353e9702ace4f3c3de8a0b8d5999888ad228473')
sha512sums_armv7h=('83df4f39a4689d428f4fff4909eed143eade7afadf82e36d7f8185f2158ec86746cef4587e88c4405099fc62abf6c11f8cafc91ce30f29fd5380a2b2cc2738d6')
sha512sums_aarch64=('2caf906fed5c12ef9fa78095e6bff22c8faae15eabfd8d3b99ccd1ba98ff1f8f21e6fdab8dc6d9dd4785a2f7e4a87ff4501bf122df255b825bfc56870f229b71')

_sourcedirectory="$pkgname-$pkgver-$pkgrel"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_sourcedirectory/"
	bsdtar -xf 'data.tar.xz' -C "$_sourcedirectory/"

	cd "$srcdir/$_sourcedirectory/"
	sed -E -i -e "s|Exec=/opt/${_pkgname^}/$_pkgname|Exec=/usr/bin/$_pkgname|" "usr/share/applications/$_pkgname.desktop"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	install -dm755 "$pkgdir/opt/"
	cp -r --no-preserve=ownership --preserve=mode "opt/${_pkgname^}/" "$pkgdir/opt/$_pkgname/"

	chmod u+s "$pkgdir/opt/$_pkgname/chrome-sandbox"

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
