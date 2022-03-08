# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>
_pkgname='ferdi'
pkgname="$_pkgname-bin"
pkgver='5.8.0'
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
sha512sums_x86_64=('ccb08cf75afedb9c2dfc81fd34053e3fbe8146d85bfa5fa1a1ce4d4e3ca394f7bf2dcbbff32a7123ff1e26b1ce84a73ffb9b7c2e2ac98781e8db7f988ddf3b3f')
sha512sums_armv7h=('35996d172fa73ed6d4f2fac9bece1ca3a7c494ca4ade7ebb259d8be1cc2b257792560c027e5a6bc71c6de77cb600f564beb6d3e07083a0a50b9aca837d694529')
sha512sums_aarch64=('bb54dc9a43b9d1cb6c063a93db4dd34bf78b0bc3c6b68fa0e13fb3232acc2208ce93624ee7467552573295578412da29de4492dd65b48819842685f81b241b45')

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
