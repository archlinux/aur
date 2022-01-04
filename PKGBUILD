# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>
_pkgname='ferdi'
pkgname="$_pkgname-bin"
pkgver='5.6.8'
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
sha512sums_x86_64=('4b3ffca6e44eca75677a29f301f317911a98ebbda1d3e4d177861b165d6ecb1f3629d561469dd87efaa67327ce91e01a57103e28e7ac0a15c54e27b53efc0ec5')
sha512sums_armv7h=('a17c438d6e37bf50163c60c25b641eeadd3ff67328e4882f025bd732a40587886a34923ee25fab261e59c41fcdc6d441d0b9595e74f7e28a8a4a52436b3ee460')
sha512sums_aarch64=('2bce0610d0ab81509f979e6d899ac39cb047ea2d8664f3d1d8f198bffa3bc8b1021447247feac2eaadbc155a2407c2a3fd20db1cb9ed276cbcbc8980afaee871')

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
