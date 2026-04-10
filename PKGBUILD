# Maintainer: Nastya Grifon <me@nastyagrifon.me>
# Contributor: CrimsonKnight13 <archlinuxaur.8hpc6@passinbox.com>
# Contributor: jmcb <joelsgp@protonmail.com>
pkgname='parallels-client'
pkgver='21.1.26688'
# has an extra digit in the middle for some reason
_downloadver='21.1.1.26688'
pkgrel=2
pkgdesc="A remote work tool"
arch=('x86_64')
url="https://www.parallels.com/products/ras/capabilities/parallels-client/"
license=("LicenseRef-parallels-client")
depends=('zlib'
         'glibc'
         'libxtst'
         'alsa-lib'
         'libxinerama'
         'libx11'
         'pcsclite'
         'libcups'
         'libxpm'
         'libxml2-legacy'
         'libusb-compat'
         'qt5-base'
         'qt5-x11extras'
         'qt5-multimedia')
optdepends=('udisks2: USB device support'
            'qt5-webengine: embedded browser support')
options=('!strip')
source=("https://download.parallels.com/ras/v${pkgver%%.*}/${_downloadver}/RASClient-${pkgver}_x86_64.tar.bz2")
sha256sums=('d57f3513e26c6e3c152e6aa8d8fc4227795d20910f5fd9bd0e0ed301b82dc0fd')

package() {
    _opt='opt/2X/Client'
    _dest="${pkgdir}/${_opt}"
    _bin="${pkgdir}/usr/bin"
    _share="${pkgdir}/usr/share"

    cd "${srcdir}/${_opt}"

    # binaries
    install -dm755 "${_dest}/bin" "${_bin}"
    install -t "${_dest}/bin/" bin/2XClient bin/appserverclient bin/downloader
    ln -s "/${_opt}/bin/2XClient" "${_bin}/${pkgname}"
    ln -s -t "${_bin}/" "/${_opt}/bin/2XClient" "/${_opt}/bin/appserverclient"

    # libraries + ld config
    install -dm755 "${_dest}/lib"
    install -t "${_dest}/lib/" lib/*.so*
    install -m644 -t "${_dest}/lib/" lib/fipsmodule.cnf lib/openssl.cnf
    install -dm755 "${pkgdir}/etc/ld.so.conf.d"
    echo "/${_opt}/lib" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    # license
    install -Dm644 doc/EULA.txt "${_dest}/doc/EULA.txt"
    install -dm755 "${_share}/licenses/${pkgname}"
    ln -s "/${_opt}/doc/EULA.txt" "${_share}/licenses/${pkgname}/LICENSE"

    # share files
    install -dm755 "${_dest}/share" "${_dest}/share/mime" "${_dest}/share/sharedmimeinfo"
    find share/ -maxdepth 1 -type f -exec install -m644 -t "${_dest}/share" {} +
    find share/mime/ -type f -exec install -m644 -t "${_dest}/share/mime" {} +
    find share/sharedmimeinfo/ -type f -exec install -m644 -t "${_dest}/share/sharedmimeinfo" {} +

    # desktop entries with WMClass patch
    install -dm755 "${_share}/applications"
    for _f in rasclient rassession tuxclient; do
        install -m644 "share/${_f}.desktop" "${_share}/applications/"
    done
    echo "StartupWMClass=2XClient"        >> "${_share}/applications/rasclient.desktop"
    echo "StartupWMClass=appserverclient" >> "${_share}/applications/rassession.desktop"

    # symlinks
    install -dm755 "${_share}/mime/packages" "${_share}/pixmaps" "${pkgdir}/usr/lib/udev/rules.d"
    ln -s "/${_opt}/share/sharedmimeinfo/2XClient.xml" "${_share}/mime/packages/2XClient.xml"
    ln -s "/${_opt}/share/2X.png" "${_share}/pixmaps/2X.png"
    ln -s "/${_opt}/share/udev.rules" "${pkgdir}/usr/lib/udev/rules.d/90-rasusb.rules"
}

