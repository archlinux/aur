# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: sinkuu <sinkuupump@gmail.com>
#
_install_cron_file=
_install_logrotate_file="y"

pkgname="clamav-unofficial-sigs"
pkgver="5.6.2"
pkgrel="1"
pkgdesc="ClamAV Unofficial Signatures Updater maintained by eXtremeSHOK.com"
url="https://github.com/extremeshok/clamav-unofficial-sigs"
arch=('any')
license=('BSD')
depends=('clamav' 'rsync' 'bind-tools' 'curl')
source=("https://github.com/extremeshok/clamav-unofficial-sigs/archive/$pkgver.tar.gz"
    'cron'
    'logrotate'
    'clamav-unofficial-sigs.8'
    'clamav-unofficial-sigs.service.patch'
)
sha256sums=('233404d767fcb7d2b82defef831d584cbbcc7105f6bbc586d69a0a960bc0d4df'
            '82d1db1f7f8400d4b5457343a6c6e1c32cffbee06b0f73104c5b11641b58fa74'
            'ad2dee4d8d21483f33f9e95a808c598c98c03014baffa12141ecaefcd2cc3a79'
            '4bc5487486a2bc11ba827eeaf41bf866c5da34633bef7d801af34cbe7f8d1801'
            '8134f43041eefb5f37912a76937b65e4203b3fe0c2625220d7b2ab1d41d6a6e6')
backup=('etc/clamav-unofficial-sigs/user.conf')
install='clamav-unofficial-sigs.install'

package() {
    cd "$pkgname-$pkgver"

    patch -p0 < $srcdir/clamav-unofficial-sigs.service.patch

    install -Dm755 clamav-unofficial-sigs.sh "${pkgdir}/usr/bin/clamav-unofficial-sigs.sh"
    install -Dm644 "${srcdir}/clamav-unofficial-sigs.8" "${pkgdir}/usr/share/man/man8/clamav-unofficial-sigs.8"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/clamav-unofficial-sigs/LICENSE"
    install -d -o clamav -g clamav "${pkgdir}/var/lib/clamav-unofficial-sigs"
    install -d -o clamav -g clamav "${pkgdir}/var/log/clamav-unofficial-sigs"

    mkdir -p "${pkgdir}/etc/clamav-unofficial-sigs"
    install -Dm644 config/master.conf "${pkgdir}/etc/clamav-unofficial-sigs/master.conf"
    install -Dm644 config/os.archlinux.conf "${pkgdir}/etc/clamav-unofficial-sigs/os.conf"
    install -Dm644 config/user.conf "${pkgdir}/etc/clamav-unofficial-sigs/user.conf"

    if [ -n "$_install_logrotate_file" ]; then
        install -Dm644 "${srcdir}/logrotate" "${pkgdir}/etc/logrotate.d/clamav-unofficial-sigs"
    fi

    if [ -n "$_install_cron_file" ]; then
        install -Dm644 "${srcdir}/cron" "${pkgdir}/etc/cron.d/clamav-unofficial-sigs"
    fi

    install -d "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 systemd/* "${pkgdir}/usr/lib/systemd/system/"
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
