# Maintainer: Ivan Gabaldon <aur[at]inetol.net>

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
#! This package is NOT checked by checksums, careful... !#
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#
pkgname=termius-deb
_pkgname=Termius
pkgver=9.22.1
pkgrel=1
pkgdesc='Desktop SSH Client (deb release)'
arch=('x86_64')
url='https://termius.com'
license=('LicenseRef-Termius')
makedepends=('links')
_electron=electron21
provides=("${pkgname//-deb}")
conflicts=("${pkgname//-deb}" "${pkgname//-deb/'-beta'}")
source=("${pkgname//-deb}-rolling.deb::https://autoupdate.termius.com/linux/$_pkgname.deb"
        "${pkgname//-deb}.sh")
b2sums=('SKIP'
        '16be5f2c2d1134875ac9a284138d2fc6d2133f3588d4efd34422be1c99caddf37e88c53c8b1a1286de0e6ae0d2a806983c2bf91abcff269295fc487bdde56051')

prepare() {
    sed -i "s|@ELECTRON@|$_electron|" "${pkgname//-deb}.sh"

    mkdir -p "${pkgname//-deb}-rolling/"
    bsdtar -xpf 'data.tar.xz' -C "${pkgname//-deb}-rolling/"

    # Convert
    cd "${pkgname//-deb}-rolling/"

    links -width 80 -dump 'https://termius.com/terms-of-use' | sed -n '/Terms and Conditions/,/Last updated:/p' > "opt/$_pkgname/resources/LICENSE"

    cat "../${pkgname//-deb}.sh" > "opt/$_pkgname/resources/${pkgname//-deb}"

    mv "usr/share/applications/${pkgname//-deb/'-app'}.desktop" "opt/$_pkgname/resources/${pkgname//-deb}.desktop"
    sed -i -e "s|Exec=.*|Exec=/usr/bin/${pkgname//-deb} %U|" -e "s|Icon=.*|Icon=${pkgname//-deb}|" "opt/$_pkgname/resources/${pkgname//-deb}.desktop"

    mv "usr/share/icons/hicolor/512x512/apps/${pkgname//-deb/'-app'}.png" "opt/$_pkgname/resources/${pkgname//-deb}.png"
}

pkgver() {
    mkdir -p "${pkgname//-deb}-control/"
    bsdtar -xpf 'control.tar.gz' -C "${pkgname//-deb}-control/"

    grep 'Version:' "${pkgname//-deb}-control/control" | awk '{print $2}'
}

package() {
    depends=("$_electron-bin"
             'gcc-libs'
             'glib2'
             'glibc'
             'libsecret'
             'systemd-libs'
             'zlib')

    optdepends=('libappindicator-gtk3: Systray indicator support')

    install -d "$pkgdir/opt/${pkgname//-deb}/"
    cp -a "${pkgname//-deb}-rolling/opt/$_pkgname/resources/." "$pkgdir/opt/${pkgname//-deb}/"

    chmod 755 "$pkgdir/opt/${pkgname//-deb}/${pkgname//-deb}"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}" "$pkgdir/usr/bin/${pkgname//-deb}"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}.desktop" "$pkgdir/usr/share/applications/${pkgname//-deb}.desktop"

    install -d "$pkgdir/usr/share/icons/"
    ln -s "/opt/${pkgname//-deb}/${pkgname//-deb}.png" "$pkgdir/usr/share/icons/${pkgname//-deb}.png"

    install -d "$pkgdir/usr/share/licenses/${pkgname//-deb}/"
    ln -s "/opt/${pkgname//-deb}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname//-deb}/LICENSE"
}
