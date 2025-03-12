# Maintainer: Automne von Einzbern <archlinux@automne.me>
pkgname=rundeck-community
pkgver=5.10.0.20250312
pkgrel=1
pkgdesc="Rundeck is an open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="https://www.rundeck.com/open-source"
license=('Apache')
depends=('java-runtime>=11')
makedepends=()
backup=(
    'etc/rundeck/admin.aclpolicy'
    'etc/rundeck/framework.properties'
    'etc/rundeck/jaas-loginmodule.conf'
    'etc/rundeck/log4j2.properties'
    'etc/rundeck/profile'
    'etc/rundeck/project.properties'
    'etc/rundeck/realm.properties'
    'etc/rundeck/rundeck-config.properties'
    'etc/rundeck/ssl/ssl.properties'
)
options=('!strip')
install=rundeck.install
source=(
        "rundeck-community-${pkgver}-${pkgrel}.noarch.rpm::https://packagecloud.io/pagerduty/rundeck/packages/rpm_any/rpm_any/rundeck-5.10.0.20250312-1.noarch.rpm/download.rpm?distro_version_id=227"
        "rundeckd.service"
)
sha256sums=(
        '53519d54b7ee506088208f9868a19b569686097741e23a9b69f41d24be8d0025'
        '22c7cc157857ef2e2f2fe89b36cd7902566dad40074f01537c1c91d39fd6f1d8'
)

package() {
    # Create necessary directories
    install -dm755 "${pkgdir}/etc/rundeck"
    install -dm755 "${pkgdir}/var/lib/rundeck"
    install -dm755 "${pkgdir}/var/log/rundeck"
    install -dm755 "${pkgdir}/var/lib/rundeck/bootstrap"
    install -dm755 "${pkgdir}/var/lib/rundeck/libext"
    install -dm755 "${pkgdir}/usr/lib/systemd/system"

    cd "${srcdir}"
    cp -r etc/rundeck/* "${pkgdir}/etc/rundeck/"
    cp -r var/lib/rundeck/* "${pkgdir}/var/lib/rundeck/"

    # Install systemd service
    install -Dm644 "${srcdir}/rundeckd.service" "${pkgdir}/usr/lib/systemd/system/rundeckd.service"

    find "${pkgdir}/var/lib/rundeck" -type d -exec chmod 755 {} +
    find "${pkgdir}/var/log/rundeck" -type d -exec chmod 755 {} +
    find "${pkgdir}/etc/rundeck" -type d -exec chmod 755 {} +

    # Set file permissions
    find "${pkgdir}/var/lib/rundeck" -type f -exec chmod 644 {} +
    find "${pkgdir}/var/log/rundeck" -type f -exec chmod 644 {} +
    find "${pkgdir}/etc/rundeck" -type f -exec chmod 644 {} +

}
