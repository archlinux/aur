# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
_electron='electron25'
pkgverorg='6.4.1-beta.2'
pkgver='6.4.1.beta.2'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (nightly binary release).'
arch=('x86_64' 'armv7l' 'aarch64')
url="https://$_pkgname.org"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' "$_electron")
makedepends=('asar')
provides=(
    'ferdium'
)
conflicts=(
    'ferdium'
    'ferdium-bin'
    'ferdium-nightly-bin'
    'ferdium-nightly'
    'ferdium-beta-bin'
    'ferdium-beta'
    'ferdium-git'
    'ferdium-electron'
)
_releaseurl="https://github.com/$_pkgname/$_pkgname-app/releases/download/v$pkgverorg"
source_x86_64=("$pkgname-$pkgverorg-$pkgrel-amd64.zip::${_releaseurl}/Ferdium-linux-${pkgverorg}-amd64.deb")
source_armv7l=("$pkgname-$pkgverorg-$pkgrel-armv7l.zip::${_releaseurl}/Ferdium-linux-${pkgverorg}-armv7l.deb")
source_aarch64=("$pkgname-$pkgverorg-$pkgrel-arm64.zip::${_releaseurl}/Ferdium-linux-${pkgverorg}-arm64.deb")
sha512sums_x86_64=('b6298f889964a1bd9481f7ea958b3adad54e10371a8bc575105f368240a1451f6ae846454d1de9327f5b4c54f4a530d88c11421fd46a5a08e09c13db4b8efc07')
sha512sums_armv7l=('bae0aa68829e01683b945f4be09db6466aad7bbfaa0a066a0160754ecdc5ed47d53bfa44bf46209364713a3936715d8a25fafe01126260a1167aacbd488e4f63')
sha512sums_aarch64=('fecfc9360982e230c52716a78acba33fd02eee17f8dc56cc76feeb75a7243fe9f452b908d48868b1b2b0aba9269793f47824aa5dcb4b0c4eb6833c96b88d92db')

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

	# Create a shell script to start Ferdium with Electron
	install -d -m755 "${pkgdir}/usr/bin/"
	cat > "$pkgdir/usr/bin/$_pkgname" <<EOF
    #!/bin/sh
ELECTRON_IS_DEV=0 exec /usr/bin/$_electron /opt/$pkgname/ "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/ferdium"

	# Extract the asar file from the downloaded package to the system
	install -d -m755 "${pkgdir}/opt/$pkgname/"
	asar e "opt/${_pkgname^}/resources/app.asar" "${pkgdir}/opt/$pkgname/"

	# Install the .desktop file from the downloaded package
	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE.electron.txt' 'LICENSES.chromium.html'; do
		ln -sf "/opt/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
