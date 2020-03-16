# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7171.2018.0808.1
pkgrel=4
pkgdesc='VPN client used to connect to F5Networks BIG-IP APM 13.0'
arch=('x86_64')
source=('https://it.emory.edu/vpntools/linux_f5vpn.x86_64.rpm'
        'LICENSE')
sha256sums=('4aa5468417fde0122794b502ff494f5215088f323ebf7a0d38ad8da4a29870dd'
            'fc05e3488df94817af182605042f78ed6aa0fdddb1b4a38875053a0b91d756c3')
md5sums=('06b5eeb0d066239e24b35f02f78a5d7f'
        '6e606f0137167b7c584c842405dab071')
depends=(icu openssl qt5-base qt5-webkit)
url='https://support.f5.com/csp/article/K32311645#link_04_05'
license=('commercial')

package() {
    (
    cd "${srcdir}/opt/f5/vpn"
    chmod u+s svpn # f5vpn should not be run as non-root, but it calls svpn which must be run as root
    install -Dm644 "com.f5.${pkgname}.desktop" "${pkgdir}/usr/share/applications/com.f5.${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid
    for executable in $pkgname svpn tunnelserver; do
        ln -s "/opt/f5/vpn/${executable}" "${pkgdir}"/usr/bin/${executable}
    done

    # Use system QT libraries
    for library in lib/*.so.*; do
        ln -sf "/usr/${library%%.so.*}.so" "$library"
    done

    # Use system QT libraries
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
