# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>
_pkgname='ferdi'
pkgname="$_pkgname-bin"
pkgver='5.6.3'
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
sha512sums_x86_64=('5456177876ce525d363ff662c345404de82b661fd2cccd47bb692af980b0a525725e0da68cac7f82e0e5b0e09069da489a4865344f8c109f0921882866496603')
sha512sums_armv7h=('38fd4ed6255818a448cc1f8e4a781a08c912c6b8c0edce7fa76c148ab72c0c79cee8ebbf0a334bd3213c832de0787062770bcca491ba2cd16ffb2ba93263ee85')
sha512sums_aarch64=('ccc4df1889ec02b1a52cbc0a1e208a8350d03bec6e9ce817dac670c060d66edf0c020739aeaf0f13edca369c161288f58d05825c01dff9800d8ce46123ddd261')

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
