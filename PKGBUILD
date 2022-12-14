# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=webex-bin
pkgver=42.12.0.24485
pkgrel=1
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
         'pango'
         'systemd-libs'
         'upower'
         'wayland'
         'xcb-util-image'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'xcb-util-wm'
         'xdg-utils')
source=("$pkgname-$pkgver.deb::https://binaries.webex.com/WebexDesktop-Ubuntu-Gold/20221206141837/Webex.deb"
        'webex.xml'
        'https://archive.archlinux.org/packages/l/libsecret/libsecret-0.20.4-1-x86_64.pkg.tar.zst')
sha256sums=('c119963483717f37c26785c9abf3e6170c048b6ee728df4f7727b4135a26d82e'
            '736a3ee2f30c947493eb01787205fc650f08a664a2c6a4a17c4189b8e2420c5a'
            '7bc3f4e27d141cf8d1979cd49adc58ee599686f6c1a898a013ef84ac22fd1f90')
options=('!strip')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -Jxf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -dpr --no-preserve=ownership opt/ "$pkgdir/"
    rm "$pkgdir/opt/Webex/lib/libstdc++.so.6"

    cp -dp --no-preserve=ownership ../usr/lib/libsecret-1.so* "$pkgdir/opt/Webex/lib"

    mkdir -p "$pkgdir/usr/share/applications/"
    mv "$pkgdir/opt/Webex/bin/webex.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/mime/packages/"
    install -m0644 "${srcdir}/webex.xml" "${pkgdir}/usr/share/mime/packages/"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/opt/Webex/bin/CiscoCollabHost" "$pkgdir/usr/bin/webex"
}
