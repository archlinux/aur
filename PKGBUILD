# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

pkgname=termius-deb
_pkgname=Termius
pkgver=8.8.2
pkgrel=3
pkgdesc='Desktop SSH Client (deb release)'
arch=('x86_64')
url='https://termius.com'
license=('custom:proprietary')
makedepends=('links')
provides=("${pkgname//-deb}")
conflicts=("${pkgname//-deb}" "${pkgname//-deb/'-beta'}")
source=("${pkgname//-deb}-rolling.deb::https://autoupdate.termius.com/linux/$_pkgname.deb")
b2sums=('5507a333d69b2ee653d0c125000149732161edc70014fbf23453dcffdf769122196fa8127e57b9177277096b195d606665661fae0a4e5450df351714410255de')

prepare() {
    mkdir -p "${pkgname//-deb}-rolling/"
    bsdtar -xpf 'data.tar.xz' -C "${pkgname//-deb}-rolling/"

    ## License
    links -width 80 -dump 'https://termius.com/terms-of-use' | sed -n '/Terms and Conditions/,/Last updated:/p' > 'LICENSE.txt'

    ## Convert
    cd "${pkgname//-deb}-rolling/"

    mv "opt/$_pkgname/${pkgname//-deb/'-app'}" "opt/$_pkgname/${pkgname//-deb}"
    mv "usr/share/applications/${pkgname//-deb/'-app'}.desktop" "opt/$_pkgname/${pkgname//-deb}.desktop"
    sed -i -e "s|Exec=.*|Exec=/usr/bin/${pkgname//-deb}|" -e "s|Icon=.*|Icon=${pkgname//-deb}|" "opt/$_pkgname/${pkgname//-deb}.desktop"

    mv "usr/share/icons/hicolor/256x256/apps/${pkgname//-deb/'-app'}.png" "opt/$_pkgname/${pkgname//-deb}.png"

    rm -rf "opt/$_pkgname/"{*.html,*.txt}
}

pkgver() {
    mkdir -p "${pkgname//-deb}-control/"
    bsdtar -xpf 'control.tar.gz' -C "${pkgname//-deb}-control/"

    grep 'Version:' "${pkgname//-deb}-control/control" | awk '{print $2}'
}

package() {
    depends=('alsa-lib'
             'at-spi2-core'
             'cairo'
             'dbus'
             'expat'
             'gcc-libs'
             'glib2'
             'glibc'
             'gtk3'
             'hicolor-icon-theme'
             'libcups'
             'libdrm'
             'libsecret'
             'libx11'
             'libxcb'
             'libxcomposite'
             'libxdamage'
             'libxext'
             'libxfixes'
             'libxkbcommon'
             'libxrandr'
             'mesa'
             'nspr'
             'nss'
             'pango'
             'systemd-libs'
             'wayland'
             'zlib')

    optdepends=('libappindicator-gtk3: Systray indicator support'
                'xdg-utils: Open files')

    install -d "$pkgdir/opt/${pkgname//-deb}/"
    cp -a "${pkgname//-deb}-rolling/opt/$_pkgname/." "$pkgdir/opt/${pkgname//-deb}/"

    chmod 755 "$pkgdir/opt/${pkgname//-deb}/${pkgname//-deb}"
    chmod u+s "$pkgdir/opt/${pkgname//-deb}/chrome-sandbox" || true

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}" "$pkgdir/usr/bin/${pkgname//-deb}"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}.desktop" "$pkgdir/usr/share/applications/${pkgname//-deb}.desktop"

    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname//-deb}.png"

    install -Dm644 'LICENSE.txt' -t "$pkgdir/usr/share/licenses/${pkgname//-deb}/"
}
