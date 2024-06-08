# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
_electron='electron30'
_electronpackage='electron30'
pkgverorg='6.7.5-nightly.11'
pkgver='6.7.5.nightly.11'
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
sha512sums_x86_64=('93070c99690d20cebf501dc4a25497fb87360fb66502cc0bdd1338958992835447ade6816a80d24ce953a6cd626f16fb486b3ee89624ae9b52c34ee15ce2d34c')
sha512sums_armv7l=('68f1114349418d677798abe61dc68aec6971eb60d919a8ee38cd5ffa38dc2055b5d35f9d0214c7b4ff95830e33eb57099ad23e6b2e58f99a52207ebdc38ab171')
sha512sums_aarch64=('254728ccfccb7f920e930eb356880055f4283c4095449d26ce23bc642a18db006da2067f14a3a38be48b128b153866565cee57292b107419b7bb7413d084a624')

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

	# Add an extra desktop file to run Ferdium with Wayland
	cat << EOF > "$pkgdir/usr/share/applications/$_pkgname-wayland.desktop"
[Desktop Entry]
Name=${_pkgname^} - Wayland
Exec=/usr/bin/$_pkgname --enable-features=WaylandWindowDecorations --ozone-platform-hint=wayland %U
Terminal=false
Type=Application
Icon=ferdium
StartupWMClass=Ferdium
Comment=Ferdium is your messaging app / former heir to the throne of Austria-Hungary and combines chat & messaging services into one application. Ferdium currently supports Slack, WhatsApp, Gmail, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more. You can download Ferdium for free for Mac, Windows, and Linux.
MimeType=x-scheme-handler/ferdium;
Categories=Network;InstantMessaging;
EOF

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	for _license in 'LICENSE.electron.txt' 'LICENSES.chromium.html'; do
		ln -sf "/opt/$pkgname/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
	done
}
