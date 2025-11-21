# Maintainer: devome <evinedeng@hotmail.com>

pkgname=tieba-cloud-sign
pkgver=20251120.140351
pkgrel=1
pkgdesc="Baidu Tieba Cloud Sign | 百度贴吧云签到"
arch=("any")
url="https://github.com/MoeNetwork/Tieba-Cloud-Sign"
license=("custom")
depends=("cronie" "mariadb" "php-fpm")
makedepends=("git")
backup=("srv/${pkgname}/config.php")
optdepends=("php-gd: image processing for generating verification codes"
            "apache: http service"
            "caddy: http service"
            "nginx: http service")
source=("${pkgname}::git+${url}"
        "${pkgname}.crontab"
        "${pkgname}.tmpfiles")
sha256sums=('SKIP'
            'e12cea2de704c077dcbaa137d8bb25c3b166082c7b3e78d010517ea9822fdaba'
            '60586ea4deff1434c80421c8ffa47d074fa125c9297140d58ed2f83c82d3e130')

pkgver() {
    cd "${pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${pkgname}.crontab"  "${pkgdir}/etc/cron.d/${pkgname}"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}"
    install -Dm644 license.html          "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    rm -rf .git .gitignore .github docker README.md
    find . -type f -exec install -Dm644 {} "${pkgdir}/srv/${pkgname}/"{} \;
}
