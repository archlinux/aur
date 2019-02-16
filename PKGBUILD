# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
_watch=('https://www.hiawatha-webserver.org/latest' '(\d[\d.]*)')

pkgname=hiawatha-letsencrypt
pkgver=10.8.4
pkgrel=1
pkgdesc="Let's Encrypt script for the Hiawatha webserver"
url='https://www.hiawatha-webserver.org'
arch=('any')
license=('GPL2')
depends=('php' 'hiawatha')
backup=("etc/letsencrypt/letsencrypt.conf")
source=("${url}/files/hiawatha-${pkgver}.tar.gz" 
        "${pkgname}-renew.service"
        "${pkgname}-renew.timer")

md5sums=('9bacec2a5c1db3e0f13e615f4c1e42df'
         '38c1e11a490e415b22d4e6f61db72f73'
         '72c4e3c54f6b7fe3b157ae33e79bfdef')

prepare() {
    cd "${srcdir}/hiawatha-${pkgver}/extra/letsencrypt"
    sed -e 's|/etc/init.d/hiawatha restart|systemctl restart hiawatha.service|' \
    -i letsencrypt.conf
}

package() {
    cd "${srcdir}/hiawatha-${pkgver}/extra/letsencrypt"

    # configuration file
    install -Dm644 letsencrypt.conf "${pkgdir}/etc/letsencrypt/letsencrypt.conf"

    # script and libraries
    install -Dm755 letsencrypt "${pkgdir}/usr/share/${pkgname}/letsencrypt"
    install -dm755 "${pkgdir}/usr/share/${pkgname}/libraries"
    cp -a libraries/* "${pkgdir}/usr/share/${pkgname}/libraries"

    # license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # /usr/bin link
    install -dm755 ${pkgdir}/usr/bin
    ln -sr "${pkgdir}/usr/share/${pkgname}/letsencrypt" "${pkgdir}/usr/bin/letsencrypt"

    # systemd service and timer
    install -Dm644 "${srcdir}/${pkgname}-renew.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-renew.service"
    install -Dm644 "${srcdir}/${pkgname}-renew.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}-renew.timer"
}
