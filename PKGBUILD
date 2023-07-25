# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=systemd-cron
pkgver=1.16.1
pkgrel=1
pkgdesc='systemd units to run cron scripts'
arch=(any)
url='https://github.com/systemd-cron/systemd-cron'
license=('MIT')
depends=('systemd>=229' 'run-parts' 'python')
optdepends=('smtp-forwarder: sending emails')
provides=('cron')
conflicts=('cron')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/systemd-cron/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        'sysusers.conf')
install=${pkgname}.install
sha256sums=('db30a69e4dc62592c98e13ec23e6f63f93946102cf38a481ac0e71cead358c15'
            '9260221879cca05d4c82cd12deb88759c8d9148e106f4b9891700849cef5c41b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr --confdir=/etc \
        --enable-minutely --enable-quarterly --enable-semi_annually --enable-yearly \
        --enable-persistent --enable-setgid --enable-randomized-delay
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    install -d "${pkgdir}"/etc/cron.{boot,minutely,hourly,daily,weekly,monthly,quarterly,semi-annually,yearly}
    install -dm775 "${pkgdir}/var/spool/cron"
    cat "${srcdir}/sysusers.conf" >> "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

