# Maintainer: devome <evinedeng@hotmail.com>

pkgname=tieba-cloud-sign
pkgver=20231124.154303
pkgrel=1
pkgdesc="Baidu Tieba Cloud Sign | 百度贴吧云签到"
arch=("any")
url="https://github.com/MoeNetwork/Tieba-Cloud-Sign"
license=("custom")
depends=("cronie" "mariadb" "php-fpm")
optdepends=("php-gd: image processing for generating verification codes"
            "caddy: reverse proxy php service"
            "nginx: reverse proxy php service"
            "traefik: reverse proxy php service")
source=("${pkgname}::git+${url}"
        "${pkgname}.crontab")
sha256sums=('SKIP'
            'e12cea2de704c077dcbaa137d8bb25c3b166082c7b3e78d010517ea9822fdaba')

pkgver() {
    cd "${pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${pkgname}.crontab" "${pkgdir}/etc/cron.d/${pkgname}"

    cd "${pkgname}"
    install -Dm644 license.html         "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -Dm644 README.md            "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    rm -rf .git .gitignore .github docker README.md
    mv config.php config.php.example
    find . -type f -exec install -Dm644 {} "${pkgdir}/srv/${pkgname}/"{} \;
}
