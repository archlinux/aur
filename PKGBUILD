# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=systemd-cron
pkgver=1.5.14
pkgrel=1
pkgdesc='systemd units to run cron scripts'
arch=(any)
url='https://github.com/systemd-cron/systemd-cron'
license=('MIT')
depends=('systemd>=229' 'run-parts' 'python')
optdepends=('smtp-forwarder: sending emails')
provides=('cron')
conflicts=('cron')
source=("https://github.com/systemd-cron/${pkgname}/archive/v${pkgver}.tar.gz"
        'sysusers.conf')
install=${pkgname}.install
sha256sums=('eb08a31028ec07a1dd60efa0153e5d5c2b4f456cc975af055b947f9c177ac715'
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
    install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}

