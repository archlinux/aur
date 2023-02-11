# Maintainer: Mark Collins <tera_1225 hatt hotmail.com>
pkgname=alltube
pkgver=3.1.0
pkgrel=1
pkgdesc="PHP youtube-dl frontend"
arch=("any")
url="https://github.com/Rudloff/alltube/"
license=('GPL')
depends=('apache' 'php' 'php-intl' 'youtube-dl' 'ffmpeg')
makedepends=()
backup=("etc/httpd/conf/extra/vhosts/${pkgname}.$(uname -n).conf"
        "etc/webapps/${pkgname}/config/config.yml")
source=("https://github.com/Rudloff/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip"
        "${pkgname}.apache.conf")
md5sums=('0a601b8c76c70a5eb6a33eafd0b59422'
         '1f4ced29c07b2e35c1caa4f3c603b979')


package() {
    install -d -o http -g http "${pkgdir}/etc/httpd/conf/extra/vhosts/"
    install -d -o http -g http "${pkgdir}/usr/share/webapps/${pkgname}"
    install -d -o http -g http "${pkgdir}/etc/webapps/${pkgname}/config/"

    echo "Installing apache config file"
    install -D -m 644 -o http -g http "${pkgname}.apache.conf" "${pkgdir}/etc/httpd/conf/extra/vhosts/${pkgname}.$(uname -n).conf" || return 1

    echo "Installing webapp"
    cd "${srcdir}"
    cp -a "${pkgname}" "${pkgdir}/usr/share/webapps/" || return 1
    chown -R http:http "${pkgdir}/usr/share/webapps/${pkgname}" || return 1
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type d -exec chmod 744 "{}" \;
    find "${pkgdir}/usr/share/webapps/${pkgname}" -name "*" -type f -exec chmod 644 "{}" \;

    echo "Installing example config file"
    install -m 644 -o http -g http "${srcdir}/${pkgname}/config/config.example.yml" "${pkgdir}/etc/webapps/${pkgname}/config/config.yml" || return 1

    cd "${pkgdir}/usr/share/webapps/${pkgname}"
    rm -R "config"
    ln -s "/etc/webapps/${pkgname}/config" "config"
}
