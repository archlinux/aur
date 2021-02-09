# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=systemd-cron
pkgver=1.5.17
pkgrel=2
pkgdesc='systemd units to run cron scripts'
arch=(any)
url='https://github.com/systemd-cron/systemd-cron'
license=('MIT')
depends=('systemd>=229' 'run-parts' 'python')
optdepends=('smtp-forwarder: sending emails')
provides=('cron')
conflicts=('cron')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/systemd-cron/${pkgname}/archive/v${pkgver}.tar.gz"
        'sysusers.conf')
install=${pkgname}.install
sha256sums=('847132a4517f03cf94253f275f006956d8c97a3506db450d33cbd36a25e3bf73'
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

