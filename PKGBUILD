# Maintainer: Automne von Einzbern <archlinux@automne.me>
pkgname=rundeck-community
pkgver=5.17.0.20251103
pkgrel=1
pkgdesc="Rundeck is an open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="https://www.rundeck.com/open-source"
license=('Apache')
depends=('java-runtime>=11' 'postgresql-jdbc')
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
        "rundeck-community-${pkgver}-${pkgrel}.noarch.rpm::https://packagecloud.io/pagerduty/rundeck/packages/rpm_any/rpm_any/rundeck-${pkgver}-1.noarch.rpm/download.rpm?distro_version_id=227"
        "rundeckd.service"
)
sha256sums=(
        'c7852805c7e95cf2cc33f2e4a43da8ea9a2d0bd9d0f811973d71ce70b5114409'
        'd0fd0c817aa86e1fe43c1d1a5a71465624916ca54fb7405cb09e6b01ac31cca1'
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

    # Replace war path in systemd service file
    local war_file
    war_file=$(find "${srcdir}/var/lib/rundeck/bootstrap" -name "*.war")
    sed -i "s|_RUNDECK_ENTRYPOINT_|${war_file##*/}|" "${pkgdir}/usr/lib/systemd/system/rundeckd.service"

    find "${pkgdir}/var/lib/rundeck" -type d -exec chmod 755 {} +
    find "${pkgdir}/var/log/rundeck" -type d -exec chmod 755 {} +
    find "${pkgdir}/etc/rundeck" -type d -exec chmod 755 {} +

    # Set file permissions
    find "${pkgdir}/var/lib/rundeck" -type f -exec chmod 644 {} +
    find "${pkgdir}/var/log/rundeck" -type f -exec chmod 644 {} +
    find "${pkgdir}/etc/rundeck" -type f -exec chmod 644 {} +

}
