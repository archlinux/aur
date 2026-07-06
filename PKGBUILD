# Maintainer: Dwayne Bent <dbb@dbb.io>
pkgname=systemd-cron
pkgver=2.8.2
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
    'tmpfiles.conf'
)
sha256sums=('4293c016fc5ed17834ef0b90fd1dc7baa05fdae13053992a5d594a99cb12f4c5'
            'aaf583ef55bed1c7d8e133e99ef7d5af002b6de6da27cdbe2989edfb19d90c6d'
            'a908478a96f7361a7ed0c1ad3fd20ced55ff1de7754fd5a2555d14293d657fe5')

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
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
