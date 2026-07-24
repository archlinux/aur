# Maintainer: jhonforbes_2009 <hermanojhonforbes@hotmail.com>
pkgname=google-chrome-dev-bin
pkgver=152.0.7967.2
pkgrel=1
pkgdesc="The web browser from Google (Dev channel)"
arch=('x86_64')
url="https://www.google.com/chrome/dev"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcursor' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxshmfence' 'libxtst' 'mesa' 'nss' 'nspr' 'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils' 'hicolor-icon-theme' 'ca-certificates' 'wget' 'libcurl-gnutls')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
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
            'qt5-base: for using Qt5 file dialogs'
            'qt6-base: for using Qt6 file dialogs'
            'kdialog: for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'gnome-control-center: for default browser settings in GNOME')
provides=('google-chrome-dev' 'google-chrome')
conflicts=('google-chrome-dev' 'google-chrome')
options=('!emptydirs' '!strip' '!zipman')
source=("https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb")
sha256sums=()

pkgver() {
    # Leer la versión desde el repositorio APT oficial de Google
    echo "${_ver:-$pkgver}"
}

prepare() {
    cd "$srcdir"
    bsdtar -xf *.deb
    bsdtar -xf data.tar.*
}

package() {
    mkdir -p "$pkgdir/opt/google/chrome-unstable" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons/hicolor"
    
    # Copiar binarios
    cp -a "$srcdir/opt/google/chrome-unstable/." "$pkgdir/opt/google/chrome-unstable/"
    
    # Instalar iconos
    find "$pkgdir/opt/google/chrome-unstable/" -name "product_logo_*.png" | while read -r img; do
        size=$(basename "$img" | grep -oP '\d+')
        if [[ -n "$size" ]]; then
            install -Dm644 "$img" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/google-chrome-dev.png"
        fi
    done
    
    # Lanzador binario
    ln -s /opt/google/chrome-unstable/google-chrome-unstable "$pkgdir/usr/bin/google-chrome-dev"
    
    # Archivo .desktop
    cat > "$pkgdir/usr/share/applications/google-chrome-dev.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Google Chrome Dev
Exec=/usr/bin/google-chrome-dev %U
Terminal=false
Icon=google-chrome-dev
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=/usr/bin/google-chrome-dev

[Desktop Action new-private-window]
Name=New Incognito Window
Exec=/usr/bin/google-chrome-dev --incognito
EOF
}
