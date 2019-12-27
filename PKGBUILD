# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7171.2018.0808.1
pkgrel=3
pkgdesc='F5 VPN helper application for use with a browser for F5Networks BIG-IP APM 13.0'
arch=('x86_64')
source=("https://it.emory.edu/vpntools/linux_f5vpn.x86_64.rpm"
        'license.txt')
sha256sums=('4aa5468417fde0122794b502ff494f5215088f323ebf7a0d38ad8da4a29870dd'
            'fc05e3488df94817af182605042f78ed6aa0fdddb1b4a38875053a0b91d756c3')
md5sums=('06b5eeb0d066239e24b35f02f78a5d7f'
        '6e606f0137167b7c584c842405dab071')
depends=(icu openssl qt5-base qt5-webkit)
license=('commercial')

package() {
    (
    cd "${srcdir}/opt/f5/vpn"
    chmod u+s svpn
    install -Dm644 "com.f5.${pkgname}.desktop" "${pkgdir}/usr/share/applications/com.f5.${pkgname}.desktop"
    install -dm755 "${pkgdir}/usr/bin/"
    for executable in $pkgname svpn tunnelserver; do
        ln -s "/opt/f5/vpn/${executable}" "${pkgdir}"/usr/bin/${executable}
    done

    for library in lib/*.so.*; do
        ln -sf "/usr/${library%%.so.*}.so" "$library"
    done

    for plugin in platforms/*.so; do
        ln -sf "/usr/lib/qt/plugins/${plugin}" "$plugin"
    done

    for resolution in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "logos/${resolution}x${resolution}.png" \
                        "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}/apps/f5vpn.png"
    done
    )
    install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    cp -a opt "${pkgdir}"

}
