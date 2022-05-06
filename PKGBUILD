# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-bin"
pkgverorg='6.0.0-nightly.27'
pkgver='6.0.0.nightly.27'
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
sha512sums_x86_64=('971fb50399a1acfbc04121bb1f933ab4eb472fe61ae02b45719585fed7abde46c7a621d30fa009338fa63593cd367d1594b7d8ac7d12880a69149f5df3afb06f')
sha512sums_armv7l=('ce221b9cb20d65cec651c31c8c1a675aa96d6b62388533824e0ba65f3bd0c4a762a9392f023a00b2a7f69292ed09c6e5e5b5d8e42fa12cd2cca28d11203a0dbd')
sha512sums_arm64=('3501551456857443d5b8b64fbeeaa652887f184fa59190bd5a837246dd519c662d4d6d8649620cff545be2afcaac4ef85e298422a1877120e7431353467cc607')

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
