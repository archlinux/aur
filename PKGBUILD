# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=webex-bin
pkgver=42.5.0.22187
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
source=("$pkgname-$pkgver.deb::https://binaries.webex.com/WebexDesktop-Ubuntu-Gold/20220503180735/Webex.deb"
        'webex.xml'
        'https://archive.archlinux.org/packages/l/libsecret/libsecret-0.20.4-1-x86_64.pkg.tar.zst')
sha256sums=('c74aefeaea07610d6898fbf9d78a1be22e555743a58014b383d1a260622146db'
            '0d0b2664ac4aeb9a4a4b9f530dee4a14c13875735b87a3d96bf81f43eeec00ab'
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
