# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname="shlink"
pkgver=4.0.3
pkgrel=1
_phpver=8.2
pkgdesc="The definitive self-hosted URL shortener"
url="https://shlink.io"
license=("MIT")
arch=("any")
depends=("php>=${_phpver}" "php-gd" "php-apcu")
optdepends=("mariadb: database"
            "mssql-server: database"
            "mysql: database"
            "postgresql: database"
            "sqlite: database"
            "apache: web server"
            "nginx: web server")
source=("https://github.com/shlinkio/shlink/releases/download/v${pkgver}/${pkgname}${pkgver}_php${_phpver}_dist.zip")
sha256sums=('78d695d4869041c1e85607046263324018cfbc06ddf1d84ca46bb781e594d290')
install="$pkgname.install"
options=("!strip")
backup=("etc/webapps/shlink/generated_config.php")

# https://wiki.archlinux.org/title/DeveloperWiki:UID_/_GID_Database
_http_uid_gid=33

package() {
    cd "${pkgname}${pkgver}_php${_phpver}_dist"
    install -d "${pkgdir}/usr/share/webapps/${pkgname}"
    cp -r ./* "${pkgdir}/usr/share/webapps/${pkgname}"
    install -d "data" "${pkgdir}/usr/share/webapps/${pkgname}/data"
    chown -R "${_http_uid_gid}:${_http_uid_gid}" "${pkgdir}/usr/share/webapps/${pkgname}/data"

    install -D -d -o "${_http_uid_gid}" -g "${_http_uid_gid}" -m 750 "${pkgdir}/var/log/${pkgname}"
    rm -Rf "${pkgdir}/usr/share/webapps/${pkgname}/data/log"
    ln -s "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/data/log"

    install -d -o "${_http_uid_gid}" -g "${_http_uid_gid}" -m 750 "config/params" "${pkgdir}/etc/webapps/${pkgname}"
    rm -Rf "${pkgdir}/usr/share/webapps/${pkgname}/config/params"
    ln -s "/etc/webapps/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/config/params"

    install -D -d -o "${_http_uid_gid}" -g "${_http_uid_gid}" -m 750 "${pkgdir}/var/cache/${pkgname}"
    rm -Rf "${pkgdir}/usr/share/webapps/${pkgname}/data/cache"
    ln -s "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/data/cache"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/share/webapps/${pkgname}/LICENSE"

    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    rm "${pkgdir}/usr/share/webapps/${pkgname}/README.md"
}
