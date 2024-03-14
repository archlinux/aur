# Maintainer: Cedric Roijakkers <cedric [the at sign goes here] roijakkers [the dot sign goes here] be>.
# Inspired from the PKGBUILD for ferdi-bin.

_pkgname='ferdium'
pkgname="$_pkgname-nightly-bin"
_electron='electron29'
_electronpackage='electron29'
pkgverorg='6.7.2-nightly.2'
pkgver='6.7.2.nightly.2'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application (nightly binary release).'
arch=('x86_64' 'armv7l' 'aarch64')
url="https://$_pkgname.org"
license=('Apache')
depends=('nss' 'atk' 'at-spi2-atk' 'libcups' 'libdrm' 'gdk-pixbuf2' 'gtk3' 'alsa-lib' 'c-ares' 'ffmpeg' 'libevent' 'libxkbfile' 'libxslt' 'minizip' 're2' "$_electronpackage")
makedepends=('asar')
options=(!strip)
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
sha512sums_x86_64=('a0aefce059f6fb3094cea6cc34143f15a53cd42681c972d92d5413f9568dec2874f0eb0e36d7ceecb44edf7ed9acb5a217e99cf3fbbc2cff5df70f90a9f6affe')
sha512sums_armv7l=('36ffd045ec1246052a1ceb4e1df88ae605792fddb5614952dbec48d7dd18ef912012e2ee95dfa3dfa7d47f09cba10a49f0d258195459eeab0ed5abea50bb7c8b')
sha512sums_aarch64=('6b46932ac0f6b6b2c5c9666de622c8a81b3ff4db8a462e14e8e4ca408c510edaca099ca53b532f1bd6b0136dc07aeb8d98ebeccc7a719975ebea53b47b46deb3')

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
Terminal=falseparu
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
