# Maintainer: Moritz Oberjatzas <post@moritz-oberjatzas.eu>
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=webex-bin
pkgver=46.8.0.35631
pkgrel=3
pkgdesc="Webex for Linux"
arch=('x86_64')
url="https://www.webex.com/"
license=('custom')
depends=('alsa-lib'
         'at-spi2-atk'
         'at-spi2-core'
         'atk'
         'binutils'
         'krb5'
         'libcups'
         'libnotify'
         'libpulse'
         'libsecret'
         'libxcb'
         'libxcrypt-compat'
         'libxkbcommon-x11'
         'libxss'
         'mesa'
         'nspr'
         'nss'
         'openssl'
         'pango'
         'systemd-libs'
         'upower'
         'wayland'
         'xcb-util-image'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'xcb-util-wm'
         'xdg-utils')
source=("$pkgname-$pkgver.deb::https://binaries.webex.com/WebexDesktop-Ubuntu-2004-Gold/20260901162743/Webex.deb"
        'webex.xml')
sha256sums=('a11adb6a7407e61a8be35dbb7b001053867ae769f9b9656e72db0b8df0963cd3'
            '736a3ee2f30c947493eb01787205fc650f08a664a2c6a4a17c4189b8e2420c5a')
options=('!strip')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -Jxf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -dpr --no-preserve=ownership opt/ "$pkgdir/"

    # Entferne die Webex-eigenen OpenSSL-Bibliotheken,
    # damit die System-Bibliotheken (libssl.so.3, libcrypto.so.3) verwendet werden
    rm -f "$pkgdir/opt/Webex/lib/libssl.so.3"
    rm -f "$pkgdir/opt/Webex/lib/libcrypto.so.3"
    rm "$pkgdir/opt/Webex/lib/libstdc++.so.6"

    # Erstelle das Wrapper-Skript, das LD_LIBRARY_PATH setzt
    mkdir -p "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/webex" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH=/usr/lib:$LD_LIBRARY_PATH
exec /opt/Webex/bin/CiscoCollabHost "$@"
EOF
    chmod +x "$pkgdir/usr/bin/webex"

    # Desktop-Datei und MIME-Typ
    mkdir -p "$pkgdir/usr/share/applications/"
    mv "$pkgdir/opt/Webex/bin/webex.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/mime/packages/"
    install -m0644 "${srcdir}/webex.xml" "${pkgdir}/usr/share/mime/packages/"
}
