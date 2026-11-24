pkgname=orangchat-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="OrangChat desktop - a Discord-like real-time messaging client"
arch=('x86_64')
url="https://chat.oranges.lt"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: system tray icon'
            'pipewire: screen sharing on wayland')
provides=('orangchat')
conflicts=('orangchat')
options=('!strip')
source=("orangchat-${pkgver}.tar.gz::https://chat.oranges.lt/download/linux/OrangChat-${pkgver}-x64.tar.gz"
        "orangchat.png")
sha256sums=('55ea1f742d3ec721153f81e61d0b5d3cbc8d15f3bf878ed05f57d1f17166aeb8'
            '3018de2f89a912f38ae31a1c42284df05f90ce726cb1f64211774a7bc9fac71a')

package() {
	install -dm755 "${pkgdir}/opt/orangchat"
	cp -a "${srcdir}/OrangChat-${pkgver}-x64/." "${pkgdir}/opt/orangchat/"
	chmod 4755 "${pkgdir}/opt/orangchat/chrome-sandbox"
	install -dm755 "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/orangchat" <<'EOF'
#!/bin/sh
exec /opt/orangchat/orangchat "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/orangchat"

	install -Dm644 "${srcdir}/orangchat.png" \
		"${pkgdir}/usr/share/icons/hicolor/512x512/apps/orangchat.png"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/orangchat.desktop" <<'EOF'
[Desktop Entry]
Name=OrangChat
Comment=A Discord-like real-time messaging client
Exec=orangchat %U
Icon=orangchat
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupWMClass=orangchat
MimeType=x-scheme-handler/orangchat;
EOF

	install -Dm644 "${pkgdir}/opt/orangchat/LICENSE.electron.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}