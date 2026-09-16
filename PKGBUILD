# Maintainer: Moritz Oberjatzas <post@moritz-oberjatzas.eu>
# Contributor: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=webex-bin
pkgver=46.8.0.35631
pkgrel=5
pkgdesc="Webex for Linux"
arch=('x86_64')
url="https://www.webex.com/"
license=('custom')
depends=('alsa-lib'
         'at-spi2-atk'
         'at-spi2-core'
         'atk'
         'binutils'
	 'curl'
	 'hunspell'
         'krb5'
         'libcups'
	 'libnghttp2'
         'libnotify'
         'libpulse'
         'libsecret'
         'libxcb'
         'libxcrypt-compat'
         'libxkbcommon-x11'
	 'libxml2'
         'libxss'
         'mesa'
         'nspr'
         'nss'
         'openssl'
         'pango'
	 'pcre2'
         'systemd-libs'
         'upower'
         'wayland'
	 'xcb-util-cursor'
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
    
    # Remove bundled libs and use system libs instead
    for l in stdc++ crypto ssl curl hunspell nghttp2 pcre2-16 xcb-cursor xml2; do
	rm "$pkgdir"/opt/Webex/lib/lib$l.so*
    done

    mkdir -p "$pkgdir/usr/share/applications/"
    mv "$pkgdir/opt/Webex/bin/webex.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/mime/packages/"
    install -m0644 "${srcdir}/webex.xml" "${pkgdir}/usr/share/mime/packages/"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/opt/Webex/bin/CiscoCollabHost" "$pkgdir/usr/bin/webex"
}
