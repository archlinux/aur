# Thanks: Forest Crossman <cyrozap at gmail dot com>
# Maintainer: Annoyedmilk <hello@annoyedmilk.ch>
# Contributor: ResRipper <resripper@connective.link>
# Contributor: Stephanie Wilde-Hobbs <gpg@stephanie.is>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname=go-configure-sw-hub
_pkgver_major=6.54
_pkgver_minor=002
pkgver=$_pkgver_major.$_pkgver_minor

pkgrel=1
pkgdesc="Renesas/Dialog/Silego Go Configure software hub (greenpak designer)"
arch=('x86_64')
url="https://www.renesas.com/us/en/software-tool/go-configure-software-hub"
license=('custom:Go_Configure_Software_Hub_Software_Licensing_Agreement')
depends=(
    alsa-lib
    dbus
    desktop-file-utils
    expat
    fontconfig
    freetype2
    gcc-libs
    glib2
    graphviz
    krb5
    libcups
    libdrm
    libglvnd
    libxshmfence
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxi
    libxkbcommon
    libxkbcommon-x11
    libxkbfile
    libxrandr
    libxrender
    libxtst
    nspr
    nss
    shared-mime-info
    systemd-libs
    xcb-util-cursor
    xcb-util-image
    xcb-util-keysyms
    xcb-util-renderutil
    xcb-util-wm
    zlib
)
makedepends=(patchelf)
conflicts=('greenpak-designer-dev' 'greenpak-designer')
replaces=('greenpak-designer-dev' 'greenpak-designer')
options=('!strip' '!debug')

source=("https://renesasweb-greenpak.s3.us-west-2.amazonaws.com/v${_pkgver_major}/go-configure-sw-hub-v${pkgver}-debian-13-amd64.deb")
b2sums=('1e17c8842bc93af575393cde8fac8966637551045056867df94ce6fb5d58d9e7dd03712dde1feb5b28eea2cd40b890b926bec8089ad5d464bbfaef29bf3556fb')

package() {
    # Extract the package data
    tar -xf data.tar.xz -C "${pkgdir}"/

    # Install udev rules
    install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
    mv "${pkgdir}"/lib/udev/rules.d/* "${pkgdir}"/usr/lib/udev/rules.d
    rm -r "${pkgdir}"/lib

    # Move package to /opt
    install -dm 755 "${pkgdir}"/opt
    mv "${pkgdir}"/usr/local/"${pkgname}" "${pkgdir}"/opt/"${pkgname}"
    rm -r "${pkgdir}"/usr/local

    # Link launcher to /usr/bin
    rm "${pkgdir}"/usr/bin/*
    ln -s /opt/${pkgname}/bin/GPLauncher "${pkgdir}"/usr/bin/GPLauncher

    # Fix desktop launchers
    for _launcher in "${pkgdir}/usr/share/applications"/*.desktop; do
        sed -i -e "s!local/${pkgname}/!!g" "$_launcher"
    done

    # Install license file
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

    # Patch graphviz sonames — app was built against an older graphviz (soname 6),
    # Arch ships soname 7/8. Only GP5 and GP6 link against graphviz.
    for _bin in GP5 GP6; do
        patchelf --replace-needed libgvc.so.6 libgvc.so.7 "${pkgdir}/opt/${pkgname}/bin/${_bin}"
        patchelf --replace-needed libcgraph.so.6 libcgraph.so.8 "${pkgdir}/opt/${pkgname}/bin/${_bin}"
    done
}
