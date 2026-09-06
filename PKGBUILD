# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=glide-browser-bin
_binaryname=glide-bin
pkgver=0.1.64a
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
sha256sums_x86_64=('1f97b0a3d19b59ba64145b00011774147c43f405d4f037386a5bcda9aea530fd')
sha256sums_aarch64=('588b2038f28ff0af4fddd512318da23519a38049557708a59c5ee167b4f159e6')

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
StartupWMClass=glide-glide
MimeType=application/json;application/pdf;application/rdf+xml;application/rss+xml;application/x-xpinstall;application/xhtml+xml;application/xml;audio/flac;audio/ogg;audio/webm;image/avif;image/gif;image/jpeg;image/png;image/svg+xml;image/webp;text/html;text/xml;video/ogg;video/webm;x-scheme-handler/chrome;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
Actions=new-window;new-private-window;open-profile-manager;
Comment=An extensible and keyboard-focused web browser built on Firefox
X-GNOME-FullName=Glide Browser
Categories=Network;WebBrowser;
StartupWMClass=Glide Browser

[Desktop Action new-window]
Exec=/usr/bin/"$_binaryname" --new-window %u
Name=New Window

[Desktop Action new-private-window]
Exec=/usr/bin/"$_binaryname" --private-window %u
Name=New Private Window

[Desktop Action open-profile-manager]
Exec=/usr/bin/"$_binaryname" --ProfileManager
Name=Open Profile Manager
EOF

# Icons
for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_binaryname.png
done
}
