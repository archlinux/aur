# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname=iyuuplus
pkgver=20240205.034109
pkgrel=1
pkgdesc="IYUU Auto Reseed Plus | IYUU 自动辅种工具"
arch=("any")
url="https://github.com/ledccn/IYUUPlus"
license=("MulanPSL")
depends=("php-fpm")
source=("${pkgname}::git+${url}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('SKIP'
            '58d088afbc7692caec812a59247a0cf649b236bc211aa69b9ae472d70b2f24cc'
            'c27f0a22e15483e44ae48001e0f8e9564574115ec7688488f2f2e6265745be1f'
            '3b954e17e81121da378921b29e86eed4aea77e0788e13c9c28d202340eb6d0c6')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo "$(git log -1 --format="%cd" --date='format:%Y%m%d.%H%M%S')"
}

package() {
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    rm -rf "${pkgname}/"{LICENSE,README.md,.dockerignore,docker,nssm,runtime,*.cmd,windows.*,todo.*,gg.sh}
    find "${pkgname}" -iname ".git*" | sort | while read line; do rm -rf "$line"; done
    find "${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgname}/start.php"

    cp -r "${pkgname}" "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/start.php" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/var/lib/${pkgname}"/{db,runtime,.env} "${pkgdir}/usr/share/${pkgname}"
}
