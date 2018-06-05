# Maintainer: Amish <contact at via dot aur>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: sinkuu <sinkuupump@gmail.com>

pkgname="clamav-unofficial-sigs"
pkgver="5.6.2"
pkgrel="4"
pkgdesc="ClamAV Unofficial Signatures Updater maintained by eXtremeSHOK.com"
url="https://github.com/extremeshok/clamav-unofficial-sigs"
arch=('any')
license=('BSD')
depends=('clamav' 'rsync' 'bind-tools' 'curl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/extremeshok/clamav-unofficial-sigs/archive/${pkgver}.tar.gz"
    'clamav-unofficial-sigs.logrotate'
    'clamav-unofficial-sigs.tmpfiles'
    'clamav-unofficial-sigs.8'
    'os.conf'
    'custom_config.diff'
)
sha256sums=('233404d767fcb7d2b82defef831d584cbbcc7105f6bbc586d69a0a960bc0d4df'
            '0564ecac9ea02376b627fed158c9ea899c58b528d276d6d962f9e642e060239e'
            'd5441953dbfafb14764ca30b75ad1ae48dbe8a9cace6d3f72ecb9fbe82aa36ca'
            '4bc5487486a2bc11ba827eeaf41bf866c5da34633bef7d801af34cbe7f8d1801'
            '84b71e4db873b0aa85886b53ed46d1fc13323f04d8997b3e36b5acc524fb2d83'
            '79a4349d187da2e04ceb08de810ff48c603b95e23eeab9ccb776832d215c6a95')
backup=('etc/clamav-unofficial-sigs/user.conf')
install='clamav-unofficial-sigs.install'

build() {
    cd "${pkgname}-${pkgver}"
    sed -i -e 's#/usr/local/s\?bin/#/usr/bin/#g' "systemd/${pkgname}.service"
    sed -i -e 's#WantedBy=clamd@scan.service#WantedBy=timers.target#g' "systemd/${pkgname}.timer"
    patch < "${srcdir}/custom_config.diff"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 -t "${pkgdir}/etc/clamav-unofficial-sigs" "${srcdir}/os.conf" config/{master,user}.conf
    install -Dm644 "${srcdir}/clamav-unofficial-sigs.logrotate" "${pkgdir}/etc/logrotate.d/clamav-unofficial-sigs"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" systemd/${pkgname}.{service,timer}
    install -Dm644 -t "${pkgdir}/usr/share/man/man8" "${srcdir}/clamav-unofficial-sigs.8"
    install -Dm755 -t "${pkgdir}/usr/bin" clamav-unofficial-sigs.sh
    install -Dm644 "${srcdir}/clamav-unofficial-sigs.tmpfiles" "${pkgdir}"/usr/lib/tmpfiles.d/clamav-unofficial-sigs.conf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/clamav-unofficial-sigs" LICENSE
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
