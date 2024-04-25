# Maintainer: devome <evinedeng@hotmail.com>

pkgname=iyuuplus
pkgver=20240425.121223
pkgrel=1
epoch=2
pkgdesc="IYUU Auto Reseed Plus"
arch=("any")
url="https://github.com/ledccn/iyuuplus-dev"
license=("MIT")
depends=("composer" "mariadb" "php-fpm" "php-gd" "php-sodium" "php-sqlite")
makedepends=("git")
source=("${pkgname}::git+${url}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('SKIP'
            '2518b01fca4b6b49f37c4eba9bc0aaf31d787a016daa6baa5812b3632b92c3f3'
            '74636a75d9e2837db2441805c50117def6f63dc7671ea3ff83c12361d246650d'
            '743176e2e49ed2b51ffb562731c6f785718ffa9fdf58479c668f17abcf4463db')
options=(!strip !debug)

pkgver() {
    cd "${pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md             "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    rm -rf .dockerignore docker runtime windows.* gg.sh LICENSE README.md
    find . \( -iname ".git*" -o -iname "README.md" \) | sort | while read line; do rm -rf "$line"; done
    find . -type f -exec install -Dm644 {} "${pkgdir}/var/lib/${pkgname}/"{} \;
    chmod 755 "${pkgdir}/var/lib/${pkgname}/start.php"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/var/lib/${pkgname}/start.php" "${pkgdir}/usr/bin/${pkgname}"
}
