# Maintainer: devome <evinedeng@hotmail.com>

pkgname=iyuuplus
pkgver=20240205.034109
pkgrel=2
pkgdesc="IYUU Auto Reseed Plus | IYUU 自动辅种工具"
arch=("any")
url="https://github.com/ledccn/IYUUPlus"
license=("MulanPSL-1.0")
depends=("php-fpm")
source=("${pkgname}::git+${url}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('SKIP'
            '6e1e437b71fcfe19e542254181d39eb479e16fea5fcaf5d1179d7ec8cd176520'
            '74636a75d9e2837db2441805c50117def6f63dc7671ea3ff83c12361d246650d'
            '35defea40aa4a403e07f9cd4474479a41cabc306b8c0f29192cd39f77f76e4f9')
options=(!strip)

pkgver() {
    cd "${pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${pkgname}.service"   "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"  "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"  "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}/LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    rm -rf "${pkgname}/"{LICENSE,README.md,.dockerignore,docker,nssm,runtime,*.cmd,windows.*,todo.*,gg.sh}
    find "${pkgname}" -iname ".git*" | sort | while read line; do rm -rf "$line"; done
    find "${pkgname}" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/"{} \;
    chmod 755 "${pkgdir}/usr/share/${pkgname}/start.php"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/start.php"       "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/var/lib/${pkgname}"/{db,runtime,.env} "${pkgdir}/usr/share/${pkgname}"
}
