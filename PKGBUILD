# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-bin"
_electron='electron33'
_electronpackage='electron33'
pkgverorg='7.0.1'
pkgver='7.0.1'
pkgrel='2'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (binary release).'
arch=('x86_64' 'armv7l' 'aarch64')
url="https://$_pkgname.org"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' 'snappy' "$_electronpackage")
makedepends=('asar')
options=(!strip !debug)
provides=(
    'ferdium'
)
conflicts=(
    'ferdium'
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
sha512sums_x86_64=('af8587bd639c54a2eafbbe61f8a641208b5837106c2806599760b8063150b347448f034306c52141968338714f3ad339b1d4e2f3fdc96d9b2e0da7470e8e1d45')
sha512sums_armv7l=('9a2b06de6f85d1ee1f853c6104e6f4b6341e2c034eba99752dbf386c2834989a5318b1de1f590c97f9f34ab7f1def1b74240502d44eea67dcbf30518e626850d')
sha512sums_aarch64=('5942cc7782126d68b9cefd0979f64b046a4787433b96ba4732f837f8d4698428a69f9fb4cf0ce51e8e1e28bd52c351ccf30e9c22f5d9fa5c5b894c404f1d3135')

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
