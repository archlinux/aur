# Maintainer: jhonforbes_2009 <hermanojhonforbes@hotmail.com>
pkgname=microsoft-edge-stable
pkgver=150.0.4078.96
pkgrel=1
pkgdesc="The web browser from Microsoft (Stable channel)"
arch=('x86_64')
url="https://www.microsoft.com/en-us/edge"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcursor' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxshmfence' 'libxtst' 'mesa' 'nss' 'nspr' 'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils' 'hicolor-icon-theme' 'ca-certificates' 'wget' 'libcurl-gnutls' 'qt5-base' 'qt6-base')
optdepends=('libunity: for download progress badges'
            'pipewire: WebRTC desktop sharing under Wayland'
            'wayland: for native Wayland support'
            'vulkan-icd-loader: for Vulkan GPU acceleration'
            'libglvnd: for OpenGL dispatch'
            'libpulse: for PulseAudio audio backend'
            'libsecret: for storing passwords'
            'krb5: for Kerberos network authentication'
            'libspeechd: for text-to-speech support'
            'libva: for hardware video decoding (VA-API)'
            'onnxruntime: for local AI model execution'
            'apparmor: for additional process sandboxing'
            'kdialog: for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'gnome-control-center: for default browser settings in GNOME')
provides=('microsoft-edge' 'microsoft-edge-stable')
conflicts=('microsoft-edge' 'microsoft-edge-stable')
options=('!emptydirs' '!strip' '!zipman')
source=()
sha256sums=()

pkgver() {
    _url="https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/"
    _deb=$(curl -fsSL -A "Mozilla/5.0" "$_url" | grep -oP 'href="microsoft-edge-stable_[0-9][^"]*_amd64.deb"' | sed 's/href="//;s/"$//' | sort -V | tail -1)
    _ver=$(echo "$_deb" | grep -oP '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    echo "${_ver:-$pkgver}"
}

prepare() {
    cd "$srcdir"
    _url="https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${pkgver}-1_amd64.deb"
    curl -fsSL -A "Mozilla/5.0" -o edge-stable.deb "$_url"
    bsdtar -xf edge-stable.deb
    bsdtar -xf data.tar.*
}

package() {
    mkdir -p "$pkgdir/opt/microsoft/msedge" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons/hicolor"
    
    cp -a "$srcdir/opt/microsoft/msedge/." "$pkgdir/opt/microsoft/msedge/"
    
    find "$pkgdir/opt/microsoft/msedge/" -name "product_logo_*.png" | while read -r img; do
        size=$(basename "$img" | grep -oP '\d+')
        if [[ -n "$size" ]]; then
            install -Dm644 "$img" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/microsoft-edge.png"
        fi
    done
    
    ln -s /opt/microsoft/msedge/microsoft-edge "$pkgdir/usr/bin/microsoft-edge"
    
    cat > "$pkgdir/usr/share/applications/microsoft-edge.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Microsoft Edge
Exec=/usr/bin/microsoft-edge %U
Terminal=false
Icon=microsoft-edge
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=/usr/bin/microsoft-edge

[Desktop Action new-private-window]
Name=New InPrivate Window
Exec=/usr/bin/microsoft-edge --inprivate
EOF
}
