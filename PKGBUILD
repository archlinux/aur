# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
_electron='electron33'
_electronpackage='electron33'
pkgverorg='7.0.1-nightly.7'
pkgver='7.0.1.nightly.7'
pkgrel='1'
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
sha512sums_x86_64=('ad8feb2d1fd0bbb90d30e0e8247a6d16444629e8ce7d99213e3c63d54a059763ac0732124cf320fb1979dfb77847460a5fc55ce0b69a69ad1dad1ad20e513884')
sha512sums_armv7l=('2af0c59d258e2cbeda2eb78b62b6e5c992005014ce4cc3ac7abecafc0d30b744877ccac993d0e4d08585bf5b5ba0c78d6dfdd1c296caaaf6c4eb1f870d873204')
sha512sums_aarch64=('521b934bb61fd6504c769b1f194204b25fe8bf9112400a1f0977676ae761b301633256be63183862ca8b66219d602f80519aa995ea4447a7e4225e3e377dfe3a')

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
