# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='parallels-client'
pkgver='19.2.23906'
# has an extra digit in the middle for some reason
_downloadver='19.2.0.23906'
pkgrel=2
pkgdesc="A remote work tool (rasclient, 2x RDP client, Parallels RAS)"
arch=('x86_64')
url="https://www.parallels.com/products/ras/capabilities/parallels-client/"
license=("custom:${pkgname}")
# from .deb control.tar.xz file
depends=('libxcursor'
         'zlib'
         'fontconfig'
         'libxrender'
         'glibc'
         'libxrandr'
         'libsm'
         'libxtst'
         'libice'
         'libxext'
         'libxi'
         'gcc'
         'alsa-lib'
         'alsa-plugins'
         'libxinerama'
         'libxft'
         'libx11'
         'pcsclite'
         'libcups'
         'libxpm'
         'libxml2'
         'libmtp'
         'libusb'
         'nas'
         'udisks2'
         # includes core, gui, widgets, network, xml, dbus, pritnsupport
         'qt5-base'
         'qt5-x11extras')
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("https://download.parallels.com/ras/v${pkgver%%.*}/${_downloadver}/RASClient-${pkgver}_x86_64.tar.bz2")
noextract=()
sha256sums=('e37843a042f544bdebeccfb0a42ce1ffba30a0ee71d742493a44ee79fc554211')


package() {
    _opt='opt/2X/Client'
    _src="${srcdir}/${_opt}"
    _dest="${pkgdir}/${_opt}"

    _bin="${pkgdir}/usr/bin"
    _share="${pkgdir}/usr/share"

    cd "${_src}"

    # binaries
    install -D -t "${_dest}/bin/" 'bin/2XClient' 'bin/appserverclient' 'bin/downloader'
    # symlink binaries
    install -d "${_bin}/"
    # symlink binary with package name
    ln -s "/${_opt}/bin/2XClient" "${_bin}/${pkgname}"
    # symlink binary with original names
    # bniary
    ln -s -t "${_bin}/" \
        "/${_opt}/bin/2XClient" \
        "/${_opt}/bin/appserverclient"

    # license
    install -D -m644 -t "${_dest}/doc/" 'doc/EULA.txt' 
    # symlink license
    install -d "${_share}/licenses/${pkgname}/"
    ln -s "/${_opt}/doc/EULA.txt" "${_share}/licenses/${pkgname}/LICENSE"

    # share
    find 'share/' -type f -exec install -D -m644 -t "${_dest}/share" {} +
    find 'share/mime/' -type f -exec install -D -m644 -t "${_dest}/share/mime" {} +
    find 'share/sharedmimeinfo/' -type f -exec install -D -m644 -t "${_dest}/share/sharedmimeinfo" {} +
    # symlink share
    # symlink desktop entries
    install -d "${_share}/applications/"
    ln -s -t "${_share}/applications/" \
        "/${_opt}/share/rasclient.desktop" \
        "/${_opt}/share/appserverclient.desktop" \
        "/${_opt}/share/tuxclient.desktop"
    # symlink mime entry
    install -d "${_share}/mime/packages/"
    ln -s -t "${_share}/mime/packages/" "/${_opt}/share/2XClient.xml"
    # symlink pixmap
    install -d "${_share}/pixmaps/"
    ln -s -t "${_share}/pixmaps/" "/${_opt}/share/2X.png"
    # symlink udev rule
    install -d "${pkgdir}/usr/lib/udev/rules.d/"
    ln -s "/${_opt}/share/udev.rules" "${pkgdir}/usr/lib/udev/rules.d/90-rasusb.rules"
}
