# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=systemd-cron
pkgver=2.6.0
pkgrel=1
pkgdesc='systemd units to run cron scripts'
arch=('x86_64')
url='https://github.com/systemd-cron/systemd-cron'
license=('MIT')
depends=('systemd>=251' 'libmd')
optdepends=('smtp-forwarder: sending emails')
provides=('cron')
conflicts=('cron')
options=('debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/systemd-cron/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    'sysusers.conf'
)
install=${pkgname}.install
sha256sums=('a235dac95aa6b8339acc56d4567089f0feeed56421ff473fa161a3c8f022e813'
            '9260221879cca05d4c82cd12deb88759c8d9148e106f4b9891700849cef5c41b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr --libexecdir=/usr/lib \
        --enable-minutely --enable-quarterly --enable-semi_annually

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    install -d "${pkgdir}"/etc/cron.{boot,minutely,hourly,daily,weekly,monthly,quarterly,semi-annually,yearly}
    install -dm1730 "${pkgdir}/var/spool/cron"
    cat "${srcdir}/sysusers.conf" >>"${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
