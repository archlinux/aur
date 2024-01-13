# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname=tieba-cloud-sign
pkgver=20231124.154303
pkgrel=1
pkgdesc="Baidu Tieba Cloud Sign | 百度贴吧云签到"
arch=("any")
url="https://github.com/MoeNetwork/Tieba-Cloud-Sign"
license=("custom")
depends=("cronie" "mariadb" "php-fpm")
optdepends=("php-gd: image processing for generating verification codes | 图像处理，用于生成验证码"
            "caddy: reverse proxy php service | 代理 php webui 页面"
            "nginx: reverse proxy php service | 代理 php webui 页面"
            "traefik: reverse proxy php service | 代理 php webui 页面")
source=("${pkgname}::git+${url}"
        "${pkgname}.crontab")
sha256sums=('SKIP'
            'e12cea2de704c077dcbaa137d8bb25c3b166082c7b3e78d010517ea9822fdaba')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${pkgname}.crontab" "${pkgdir}/etc/cron.d/${pkgname}"

    rm -rf "${pkgname}/"{.git,.gitignore,.github,docker}
    mv "${pkgname}/config.php" "${pkgname}/config.php.example"
    find "${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgname}" -type f -exec chmod 644 {} \;

    install -dm755 "${pkgdir}/srv"
    cp -r "${pkgname}" "${pkgdir}/srv/${pkgname}"
}
