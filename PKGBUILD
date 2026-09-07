# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-bin"
_electron='electron43'
_electronpackage='electron43'
_pkgverorg='7.2.3'
pkgver='7.2.3'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (binary release).'
arch=('x86_64' 'armv7l' 'aarch64')
url="https://$_pkgname.org"
license=('Apache-2.0')
depends=('electron43' 'hicolor-icon-theme')
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
_releaseurl="https://github.com/$_pkgname/$_pkgname-app/releases/download/v$_pkgverorg"
source_x86_64=("$pkgname-$_pkgverorg-$pkgrel-amd64.zip::${_releaseurl}/Ferdium-linux-${_pkgverorg}-amd64.deb")
source_armv7l=("$pkgname-$_pkgverorg-$pkgrel-armv7l.zip::${_releaseurl}/Ferdium-linux-${_pkgverorg}-armv7l.deb")
source_aarch64=("$pkgname-$_pkgverorg-$pkgrel-arm64.zip::${_releaseurl}/Ferdium-linux-${_pkgverorg}-arm64.deb")
sha512sums_x86_64=('261cb5fab09329f6d114d31360d91b7279ef0d911f05cb27e4b3375ef49cecfcb18c8574053e3b8f94d8e3658e8cfb227c71c8cc1ef1f38d78096d95dc1fd29d')
sha512sums_armv7l=('c030dbb25cc3c49b21a28be8c1afb46c3d3c0ab1267087e8bd7fea58855b0951909e953d956132fdf16dcdcd65be3b176dada9af4cdc585d0e49b46a3ea0f57b')
sha512sums_aarch64=('d05245bce1bcd06a08627d5bf8d006db727e96f649487630e9a7ee598277d4b3139baa2b023a7cb81507d22a030801aa63952efc7fc4e5c29657d0ff5f3c8494')

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
