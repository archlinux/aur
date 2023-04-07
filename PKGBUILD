# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="monica-crm"
pkgver=4.0.0
pkgrel=1
pkgdesc="Personal CRM. Remember everything about your friends, family and business relationships."
url="https://www.monicahq.com/"
license=("AGPL3")
arch=("any")
depends=("php-interpreter>=8.1")
optdepends=(
    "mariadb: use local MariaDB database"
    "nginx: supported application server"
    "php-redis: cache, session and queue drivers"
)
# PGP key is commented out because it isn't clear right now who actually signs these releases
source=(
    "https://github.com/monicahq/monica/releases/download/v${pkgver}/monica-v${pkgver}.tar.bz2"
    #"https://github.com/monicahq/monica/releases/download/v${pkgver}/monica-v${pkgver}.tar.bz2.asc"
    "monica-crm-schedulerun.service"
    "monica-crm-schedulerun.timer"
)
sha512sums=(
    "68bf819e07ffa501e05b82c6c5ab578a6f8f1b86d2673d1856ef681b7476edd7d7f88859089c2846161745a0f90145493b1c6f8ce391656118c6cda30794ae54"
    #"b2e1bed4a3b80ed26989c5cf3d32cdc697da913570bacc924451579d73bb08eee9bc20a3af34cac5287fcd659231313c65f5f6ec9a5443427c25e413fb826719"
    "638655e17e071fe6e84cc779ad5348c24be555dd9d0699fdbab1f0f04b0544688d1f96903ed33aaf139d78ce1a75ffd0cc99b79a77201fe349bf7eb21a22cfed"
    "9a9309807c9bec47ff38333223a6ad8b518ce1fc89aab02f2b6d2f953c55bc048a522182842759292fa4604636e966f9bca0c213cf5f28eaef94f668693029fe"
)
backup=("etc/webapps/monica-crm/config.env")
options=("!strip")

package() {
    cd "monica-v${pkgver}"

    install -d "${pkgdir}/usr/share/webapps/monica-crm"
    cp -r ./* "${pkgdir}/usr/share/webapps/monica-crm"

    install -Dm640 -o root -g http ".env.example" "${pkgdir}/etc/webapps/monica-crm/config.env"
    ln -s "../../../../etc/webapps/monica-crm/config.env" "${pkgdir}/usr/share/webapps/monica-crm/.env"

    rm -rf "${pkgdir}/usr/share/webapps/monica-crm/bootstrap/cache"
    mkdir -p "${pkgdir}/var/cache/monica-crm"
    chown http:http "${pkgdir}/var/cache/monica-crm"
    chmod 0750 "${pkgdir}/var/cache/monica-crm"
    ln -s "../../../../../var/cache/monica-crm" "${pkgdir}/usr/share/webapps/monica-crm/bootstrap/cache"

    mkdir -p "${pkgdir}/var/lib"
    mv "${pkgdir}/usr/share/webapps/monica-crm/storage" "$pkgdir/var/lib/monica-crm"
    chown -R http:http "$pkgdir/var/lib/monica-crm"
    chmod -R 0750 "$pkgdir/var/lib/monica-crm"
    ln -s "../../../../var/lib/monica-crm" "$pkgdir/usr/share/webapps/monica-crm/storage"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/monica-crm/LICENSE.md"

    install -Dm644 "${srcdir}/monica-crm-schedulerun.service" "${pkgdir}/usr/lib/systemd/system/monica-crm-schedulerun.service"
    install -Dm644 "${srcdir}/monica-crm-schedulerun.timer" "${pkgdir}/usr/lib/systemd/system/monica-crm-schedulerun.timer"
}
