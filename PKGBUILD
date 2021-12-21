# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Utsob Roy <uroybd(at)gmail(dot)com>
_pkgname='ferdi'
pkgname="$_pkgname-bin"
pkgver='5.6.5'
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
sha512sums_x86_64=('485afe51d4f2a0a3034db82bd1f2f3db0fb6f882ab5d3ee7ffe56abb7a243e5f164b0c4e34ca1e323540ffe244ef75bbea10d7f2e31b026ae4c9c88057ab6b53')
sha512sums_armv7h=('431a93ef37439858737f7e5b5c3991601fd4ff962258105b25417b5740873bff95f12f727f2e58f177abaa1f9dbec8993300da923b69f5b61c8ec5cdc605a7f5')
sha512sums_aarch64=('0449a6d2f9bc925894e052f0e4ca2cde75474fa2aa84d9f6d0175b03b36659ecc349dc23823b477dcf24de62fcacf15d7813610d5636e326f9bb116105d239a3')

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
