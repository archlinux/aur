# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-bin"
pkgverorg='6.0.0-nightly.22'
pkgver='6.0.0.nightly.22'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (binary release).'
arch=('x86_64' 'armv7l' 'arm64')
url="https://$_pkgname.org"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' 'snappy')
provides=("$_pkgname")
conflicts=("$_pkgname")
_releaseurl="https://github.com/$_pkgname/$_pkgname-app/releases/download/v$pkgverorg"
source_x86_64=("$pkgname-$pkgverorg-$pkgrel-amd64.zip::${_releaseurl}/${_pkgname}_${pkgverorg}_amd64.deb")
source_armv7l=("$pkgname-$pkgverorg-$pkgrel-armv7l.zip::${_releaseurl}/${_pkgname}_${pkgverorg}_armv7l.deb")
source_arm64=("$pkgname-$pkgverorg-$pkgrel-arm64.zip::${_releaseurl}/${_pkgname}_${pkgverorg}_arm64.deb")
sha512sums_x86_64=('8249794a0d048422b61a32ac1ae8c4ae80ca20e7d88584104c7627a61e562cb40c6300371ccb8a7a6e5ab63b806926b21e94b3e412f223846853bc585d5379c2')
sha512sums_armv7l=('7a8dabcd25451c6c312bc4d78238af3e347f5437e561b9143c3a014122a5314da42d934f77c43d14e5f9bd288aabed69b9fdaff3f53ab280e0be9b502320917d')
sha512sums_arm64=('663dfd721423b95d8699b1f16e90d84b9e5aac350cf0cda5970731d3588a456d99e2b2f0b169dd625d425a83ae26727458cd0c95218b1ccec2ceefa06e20e19c')

_sourcedirectory="$pkgname-$pkgverorg-$pkgrel"

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
	cp -r --no-preserve=ownership --preserve=mode "opt/${_pkgname^}/" "$pkgdir/opt/$pkgname/"

	chmod u+s "$pkgdir/opt/$pkgname/chrome-sandbox"

	install -dm755 "$pkgdir/usr/bin/"
	ln -sf "/opt/$pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE.electron.txt' 'LICENSES.chromium.html'; do
		ln -sf "/opt/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
