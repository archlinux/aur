# Maintainer: jhonforbes_2009 <hermanojhonforbes@hotmail.com>
pkgname=google-chrome-beta-bin
pkgver=151.0.7922.47
pkgrel=1
pkgdesc="The web browser from Google (Beta channel)"
arch=('x86_64')
url="https://www.google.com/chrome/beta"
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
provides=('google-chrome-beta' 'google-chrome')
conflicts=('google-chrome-beta' 'google-chrome')
options=('!emptydirs' '!strip' '!zipman')
source=()
sha256sums=()

pkgver() {
    # Leer la versión desde el repositorio APT oficial de Google (Chrome Beta)
    _ver=$(curl -fsSL "https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages" | awk '/^Package: google-chrome-beta$/{flag=1} flag{print} /^$/{flag=0}' | grep -oP '^Version: \K.*' | head -1 | sed 's/^[0-9]*://' | cut -d- -f1)
    echo "$_ver"
}

prepare() {
    cd "$srcdir"
    curl -fsSL -A "Mozilla/5.0" -o chrome-beta.deb "https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb"
    bsdtar -xf chrome-beta.deb
    bsdtar -xf data.tar.*
}

package() {
    mkdir -p "$pkgdir/opt/google/chrome-beta" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons/hicolor"
    
    # Copiar binarios
    cp -a "$srcdir/opt/google/chrome-beta/." "$pkgdir/opt/google/chrome-beta/"
    
    # Instalar iconos
    find "$pkgdir/opt/google/chrome-beta/" -name "product_logo_*.png" | while read -r img; do
        size=$(basename "$img" | grep -oP '\d+')
        if [[ -n "$size" ]]; then
            install -Dm644 "$img" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/google-chrome-beta.png"
        fi
    done
    
    # Lanzador binario
    ln -s /opt/google/chrome-beta/google-chrome-beta "$pkgdir/usr/bin/google-chrome-beta"
    
    # Archivo .desktop
    cat > "$pkgdir/usr/share/applications/google-chrome-beta.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Google Chrome Beta
Exec=/usr/bin/google-chrome-beta %U
Terminal=false
Icon=google-chrome-beta
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=/usr/bin/google-chrome-beta

[Desktop Action new-private-window]
Name=New Incognito Window
Exec=/usr/bin/google-chrome-beta --incognito
EOF
}
