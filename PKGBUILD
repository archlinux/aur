# Maintainer: witt <1989161762 at qq dot com>
pkgname=sqlynx-bin
pkgver=3.6.0
pkgrel=4
pkgdesc="桌面和 Web SQL 工具"
arch=(
    'x86_64'
)
url="https://www.sqlynx.com/"
license=('custom')
conflicts=('sqlynx' 'sqlynx-bin')
provides=('sqlynx' 'sqlynx-bin' 'sqlynx-nojdk' 'sqlynx-nojdk-bin')
depends=('java-runtime>=8')
options=(
    '!strip'
    '!debug'
)
install="${pkgname}.install";
source=(
    "${pkgname%-bin}-${pkgver}.zip::https://maicong-software-1302946156.cos.ap-beijing.myqcloud.com/software/sqlynx_linux_no_jdk_${pkgver}.zip"
    "sqlynx.service"
)
sha256sums=('e0a6d0ba7cfc19d0d5ab65660452c422a1ba6ccd8cebc3ddf38cdd89c8dadeae'
            '96edc4ea1996f5152f87ad9a31dc4f85f8c32a831cb55a428a7cc3fc1c287b49')

package() {
    install -d "${pkgdir}/opt/"
    cp -r "${srcdir}/sqlynx_linux_${pkgver}" "${pkgdir}/opt/sqlynx"

    # data db
    install -dm700 "${pkgdir}/${HOME}/"
    install -dm755 "${pkgdir}/${HOME}/.config/"

    install -Dm644 "${srcdir}/sqlynx_linux_${pkgver}/data/sqlite.db" "${pkgdir}/${HOME}/.config/sqlynx/data/sqlite.db"
    install -Dm644 "${srcdir}/sqlynx_linux_${pkgver}/data/sqlite.db" "${pkgdir}/opt/sqlynx/data/init.db"
    ln -sf "${HOME}/.config/sqlynx/data/sqlite.db" "${pkgdir}/opt/sqlynx/data/sqlite.db"

    # config
    install -Dm644 "${srcdir}/sqlynx_linux_${pkgver}/config/sqlynx.yaml" "${pkgdir}/${HOME}/.config/sqlynx/config/sqlynx.yaml"
    ln -sf "${HOME}/.config/sqlynx/config/sqlynx.yaml" "${pkgdir}/opt/sqlynx/config/sqlynx.yaml"

    # # link
    # install -dm755 "${pkgdir}/usr/bin/"
    # ln -s "${pkgdir}/opt/sqlynx/sqlynx-ide.sh" "${pkgdir}/usr/bin/sqlynx"

    install -Dm755 "${srcdir}/sqlynx.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
