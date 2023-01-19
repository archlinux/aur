# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
pkgverorg='6.2.4-nightly.9'
pkgver='6.2.4.nightly.9'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (nightly binary release).'
arch=('x86_64' 'armv7l' 'aarch64')
url="https://$_pkgname.org"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' 'snappy')
provides=(
    'ferdium'
)
conflicts=(
    'ferdium'
    'ferdium-bin'
    'ferdium-nightly-bin'
    'ferdium-nightly'
    'ferdium-git'
)
_releaseurl="https://github.com/$_pkgname/$_pkgname-app/releases/download/v$pkgverorg"
source_x86_64=("$pkgname-$pkgverorg-$pkgrel-amd64.zip::${_releaseurl}/Ferdium-linux-${pkgverorg}-amd64.deb")
source_armv7l=("$pkgname-$pkgverorg-$pkgrel-armv7l.zip::${_releaseurl}/Ferdium-linux-${pkgverorg}-armv7l.deb")
source_aarch64=("$pkgname-$pkgverorg-$pkgrel-arm64.zip::${_releaseurl}/Ferdium-linux-${pkgverorg}-arm64.deb")
sha512sums_x86_64=('6628c1f5cf89cb373fcaa188676105f941c70947b2ad4aef11a7c7069bedb15fb318392b84e9aabcaea550bc3065c1c088a572145c6de64ccd18c6bb30521733')
sha512sums_armv7l=('98aad799fe7acbd25b32351edbb5c297893d24eccc85d98571020ad8593a085acac9c5c82b2ee52a5c055c49451c0d4eaff39726252435fc1ed1506e7e185156')
sha512sums_aarch64=('f7c5ce230c789428a2c5eb4219f4ff850353c209ca7f26881c30da5d6328891053d3929735885ae24b5ff4b8e63d96d3bda7e0b0e69cc7b175ab696911e22f51')

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
