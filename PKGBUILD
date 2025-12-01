# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=glide-browser-bin
_binaryname=glide-bin
pkgver=0.1.55a
pkgrel=1
pkgdesc="An extensible and keyboard-focused web browser built on Firefox"
arch=('x86_64' 'aarch64')
url="https://github.com/glide-browser/glide"
license=('MPL-2.0')
provides=("${pkgname%}=$pkgver")
conflicts=("${pkgname%}")
options=(!strip)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulse-native-provider: Audio support')
source_x86_64=("glide.linux-x86_64-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/glide.linux-x86_64.tar.xz")
source_aarch64=("glide.linux-aarch64-${pkgver}.tar.xz::${url}/releases/download/${pkgver}/glide.linux-aarch64.tar.xz")
sha256sums_x86_64=('9a393c2a607f4f966907d00c430d66b5bf556cc5d55f6555e0dfa15a95a44982')
sha256sums_aarch64=('904846c7d96b4a609b91216e77fbf977c8b30efff8aa44785afeaddafcd07471')

package() {
# Create directories
mkdir -p "$pkgdir"/usr/bin
mkdir -p "$pkgdir"/usr/share/applications
mkdir -p "$pkgdir"/opt/"$pkgname"

# Copy extracted binary contents to /opt/$pkgname
cp -r glide/* "$pkgdir"/opt/"$pkgname"/

# Create launcher script in /usr/bin
cat > "$pkgdir"/usr/bin/"$_binaryname" << EOF
#!/bin/bash
exec "/opt/$pkgname/$_binaryname" "\$@"
EOF
chmod 755 "$pkgdir"/usr/bin/"$_binaryname"

# Create desktop file
cat > "$pkgdir"/usr/share/applications/"$pkgname".desktop << EOF
[Desktop Entry]
Name=Glide Browser
Comment=${pkgdesc}
Exec=/usr/bin/"$_binaryname" %u
Terminal=false
Type=Application
Icon=${_binaryname}
Categories=Network;WebBrowser;
StartupWMClass=Glide Browser
EOF

# Icons
for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_binaryname.png
done
}
