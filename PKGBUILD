# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7211.2021.0107.1
pkgrel=2
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM 16.0'
arch=('x86_64')
source=('LICENSE'
        'no-desktop-file-dbus.patch')
# Hashes match linux_f5vpn.x86_64.rpm from APM Clients version 7.2.1 (apmclients-7210.2020.827.422-5307.0.iso) from downloads.f5.com
source_x86_64=("linux_${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm::https://connect.healthsystem.virginia.edu/public/download/linux_${pkgname}.x86_64.rpm")
sha256sums=('a8f4b5d965dc0279dd5173109892251ce5d107d9912836e6d83a9b6896eb19a1'
            '3ecd8a10941a7d81b9d16aecdf6ac9caa1f957e32a2d2c65bde5181abd1fcb73')
sha256sums_x86_64=('08a6f7fe3dc2b5bf40b6df1930c81697e4dbcbbbaa7ffe1bae5a45c0db25d77e')
md5sums=('2508fc5e24d46163844dba9534fe7924'
         '130ef2376ad4581cc91a11814c00d948')
md5sums_x86_64=('0430b76071d95dabdc7cfdefe176edf9')
depends=(icu openssl qt5-base qt5-webkit)
url='https://support.f5.com/csp/article/K32311645#link_04_05'
license=('commercial')

package() {
    (
    cd "${srcdir}/opt/f5/vpn"

    patch -i "${srcdir}/no-desktop-file-dbus.patch" # Desktop file does not work with Dbus enabled

    chmod u+s svpn # f5vpn should not be run as root, but it calls svpn which must be run as root
    install -Dm644 "com.f5.${pkgname}.desktop" "${pkgdir}/usr/share/applications/com.f5.${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid
    for executable in $pkgname svpn tunnelserver; do
        ln -s "/opt/f5/vpn/${executable}" "${pkgdir}"/usr/bin/${executable}
    done

    # Use system Qt libraries
    for library in lib/*.so.*; do
        ln -sf "/usr/${library%%.so.*}.so" "$library"
    done

    # Use system Qt libraries
    for plugin in platforms/*.so; do
        ln -sf "/usr/lib/qt/plugins/${plugin}" "$plugin"
    done

    for resolution in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "logos/${resolution}x${resolution}.png" \
                        "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}/apps/${pkgname}.png"
    done
    )
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a opt "${pkgdir}"

}
