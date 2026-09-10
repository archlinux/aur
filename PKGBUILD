# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
_electron='electron44'
_electronpackage='electron44'
_pkgverorg='7.2.4-nightly.3'
pkgver='7.2.4.nightly.3'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (nightly binary release).'
arch=('x86_64' 'aarch64')
url="https://$_pkgname.org"
license=('Apache-2.0')
depends=('electron44' 'hicolor-icon-theme')
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
_releaseurl="https://github.com/$_pkgname/$_pkgname-app/releases/download/v$_pkgverorg"
source_x86_64=("$pkgname-$_pkgverorg-$pkgrel-amd64.zip::${_releaseurl}/Ferdium-linux-${_pkgverorg}-amd64.deb")
source_armv7l=("$pkgname-$_pkgverorg-$pkgrel-armv7l.zip::${_releaseurl}/Ferdium-linux-${_pkgverorg}-armv7l.deb")
source_aarch64=("$pkgname-$_pkgverorg-$pkgrel-arm64.zip::${_releaseurl}/Ferdium-linux-${_pkgverorg}-arm64.deb")
sha512sums_x86_64=('a63d0b567ec41a64ef1a1b3c210ec04369458fa82f4540ed38225d96c9ec36961902d67bbcd1ede217696af9561980798bd036066fe0806402dac10e15feab6d')
sha512sums_aarch64=('b954a33a9dbe62909a196afe78f408803d88dfeee487e118540f0b43818ee1e87ab4e8d3d895c63d56b18c5f260cf1211a5863db5773ced124e6ba8992a0b362')

_sourcedirectory="$pkgname-$_pkgverorg-$pkgrel"

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

	# Fix the path of the application in the auto-start package to make it launch Ferdium instead of bare Electron which it autodetects
	sed -i -e "s#path = arg.path;#path = '/usr/bin/${_pkgname}';#" "${pkgdir}/opt/$pkgname/node_modules/auto-launch/dist/index.js"

	# Install the .desktop file from the downloaded package
	install -Dm644 "usr/share/applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done
}
