# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
_electron='electron37'
_electronpackage='electron37'
pkgverorg='7.1.2-nightly.3'
pkgver='7.1.2.nightly.3'
pkgrel='2'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (nightly binary release).'
arch=('x86_64' 'armv7l' 'aarch64')
url="https://$_pkgname.org"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' "$_electronpackage")
makedepends=('asar')
options=(!strip !debug)
provides=(
    'ferdium'
)
conflicts=(
    'ferdium'
    'ferdium-bin'
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
sha512sums_x86_64=('6e56b070e794cae86b503a26da3e55e30dd46fdd546eb49abd41877c916fb5172539eec0854903ed2adc5acbf205e1238e696528cfde679e169b8bc7ef500506')
sha512sums_armv7l=('77692e9ce6d36e642c4194d58c5766a73b49d19f7545a78f0d910c9c1860235e30ced61634c9e3040a1682e774f8f95be9f4c6dd84796dcb5a3e6e27ebbae68f')
sha512sums_aarch64=('4c5e0b9d0865e444bb306f55a3d0492091902ebf69bc998c5d3a0ce883f323701a955dde5a699a167e471b6bca97a28db93d9a023bdcc407bbdd0dc7085b4f4b')

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
