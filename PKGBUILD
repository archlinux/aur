# Maintainer: sinkuu <sinkuupump@gmail.com>
#
# Note:
# clamav-unofficial-sigs.sh will refuse to work
# unless you enable "user_configuration_complete" in /etc/clamav-unofficial-sigs/user.conf

_install_cron_file=
_install_logrotate_file="y"

pkgname=clamav-unofficial-sigs
pkgver=5.1.0
pkgrel=1
pkgdesc='ClamAV Unofficial Signatures Updater maintained by eXtremeSHOK.com'
arch=('any')
url='https://github.com/extremeshok/clamav-unofficial-sigs'
license=('BSD')
depends=('clamav' 'rsync' 'bind-tools' 'gnupg' 'curl')
source=("https://github.com/extremeshok/clamav-unofficial-sigs/archive/$pkgver.tar.gz"
    "cron"
    "logrotate")
sha256sums=('834d2435caf4291e720dc422987b617ce1f1661898f36082cd445f5d89752db7'
            '82d1db1f7f8400d4b5457343a6c6e1c32cffbee06b0f73104c5b11641b58fa74'
            'ad2dee4d8d21483f33f9e95a808c598c98c03014baffa12141ecaefcd2cc3a79')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 clamav-unofficial-sigs.sh "${pkgdir}/usr/bin/clamav-unofficial-sigs.sh"
    install -Dm644 clamav-unofficial-sigs.8 "${pkgdir}/usr/share/man/man8/clamav-unofficial-sigs.8"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/clamav-unofficial-sigs/LICENSE"
    install -d -o clamav -g clamav "${pkgdir}/var/lib/clamav-unofficial-sigs"
    install -d -o clamav -g clamav "${pkgdir}/var/log/clamav-unofficial-sigs"

    install -d "${pkgdir}/etc/clamav-unofficial-sigs"
    install -Dm644 config/*.conf "${pkgdir}/etc/clamav-unofficial-sigs/"
    mv "${pkgdir}/etc/clamav-unofficial-sigs/os.archlinux.conf" "${pkgdir}/etc/clamav-unofficial-sigs/os.conf"

    if [ -n "$_install_logrotate_file" ]; then
        install -Dm644 "${srcdir}/logrotate" "${pkgdir}/etc/logrotate.d/clamav-unofficial-sigs"
    fi

    if [ -n "$_install_cron_file" ]; then
        install -Dm644 "${srcdir}/cron" "${pkgdir}/etc/cron.d/clamav-unofficial-sigs"
    fi

    install -d "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 systemd/* "${pkgdir}/usr/lib/systemd/system/"
}
