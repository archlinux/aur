# Maintainer: jhonforbes_2009 <hermanojhonforbes@hotmail.com>
pkgname=google-chrome-canary-bin
pkgver=152.0.7969.0
pkgrel=1
pkgdesc="The web browser from Google (Canary channel via Chrome for Testing)"
arch=('x86_64')
url="https://googlechromelabs.github.io/chrome-for-testing/"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcursor' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxshmfence' 'libxtst' 'mesa' 'nss' 'nspr' 'pango' 'systemd-libs' 'util-linux-libs' 'xdg-utils' 'hicolor-icon-theme' 'ca-certificates' 'wget' 'libcurl-gnutls')
makedepends=('curl' 'grep')
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
options=('!emptydirs' '!strip' '!zipman')
# URL is dynamic and depends on the version returned by pkgver(), 
# so it must be downloaded in prepare().
source=()
sha256sums=()

pkgver() {
    # MÉTODO 1: API JSON de Chrome for Testing (con grep)
    _ver=$(curl -fsSL -A "Mozilla/5.0" "https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json" | grep -oP '"Canary": \{[^}]*"version": "\K[^"]+' || true)
    
    # MÉTODO 2 (FALLBACK): Si la API JSON falla, leer la API de Chromium Dash
    if [[ -z "$_ver" ]]; then
        _ver=$(curl -fsSL -A "Mozilla/5.0" "https://chromiumdash.appspot.com/fetch_releases?channel=Canary&platform=Linux" | grep -oP '"version": "\K[^"]+' | head -1 || true)
    fi
    
    # Si ambas fallan, usar la versión real hardcodeada en el PKGBUILD
    if [[ -z "$_ver" ]]; then
        _ver="$pkgver"
    fi
    
    echo "${_ver:-$pkgver}"
}

prepare() {
    cd "$srcdir"
    curl -fsSL -A "Mozilla/5.0" -o chrome-linux64.zip "https://storage.googleapis.com/chrome-for-testing-public/${pkgver}/linux64/chrome-linux64.zip"
    bsdtar -xf chrome-linux64.zip
}

package() {
    mkdir -p "$pkgdir/opt/google/chrome-canary" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/icons/hicolor"
    cp -a "$srcdir/chrome-linux64/." "$pkgdir/opt/google/chrome-canary/"
    
    find "$pkgdir/opt/google/chrome-canary/" -name "product_logo_*.png" | while read -r img; do
        size=$(basename "$img" | grep -oP '\d+')
        if [[ -n "$size" ]]; then
            install -Dm644 "$img" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/google-chrome-canary.png"
        fi
    done
    
    ln -s /opt/google/chrome-canary/chrome "$pkgdir/usr/bin/google-chrome-canary"
    
    cat > "$pkgdir/usr/share/applications/google-chrome-canary.desktop" <<EOF
[Desktop Entry]
Version=1.0
Name=Google Chrome Canary
Exec=/usr/bin/google-chrome-canary %U
Terminal=false
Icon=google-chrome-canary
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=/usr/bin/google-chrome-canary

[Desktop Action new-private-window]
Name=New Incognito Window
Exec=/usr/bin/google-chrome-canary --incognito
EOF
}
