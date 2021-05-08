# Maintainer: Amish <contact at via dot aur>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: sinkuu <sinkuupump@gmail.com>

pkgname="clamav-unofficial-sigs"
pkgver="7.2.5"
pkgrel="1"
pkgdesc="ClamAV Unofficial Signatures Updater maintained by eXtremeSHOK.com"
url="https://github.com/extremeshok/clamav-unofficial-sigs"
arch=('any')
license=('BSD')
depends=('clamav' 'rsync' 'bind-tools' 'curl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/extremeshok/clamav-unofficial-sigs/archive/${pkgver}.tar.gz"
    'clamav-unofficial-sigs.logrotate'
    'clamav-unofficial-sigs.tmpfiles'
    'os.conf'
)
sha256sums=('f42f9d68e111f892bfd71393e869e53c806f48966c768d219925de6652960c50'
            '0564ecac9ea02376b627fed158c9ea899c58b528d276d6d962f9e642e060239e'
            'd5441953dbfafb14764ca30b75ad1ae48dbe8a9cace6d3f72ecb9fbe82aa36ca'
            '434000ac8572890913775451e678ec6b23cb6570828aec8ab4c690eb3f603bfb')
backup=('etc/clamav-unofficial-sigs/user.conf')
install='clamav-unofficial-sigs.install'

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i -e 's#/usr/local/s\?bin/#/usr/bin/#g' "systemd/${pkgname}.service"
    sed -i -e 's#WantedBy=multi-user.target#WantedBy=timers.target#g' "systemd/${pkgname}.timer"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 -t "${pkgdir}/etc/clamav-unofficial-sigs" "${srcdir}/os.conf" config/{master,user}.conf
    install -Dm644 "${srcdir}/clamav-unofficial-sigs.logrotate" "${pkgdir}/etc/logrotate.d/clamav-unofficial-sigs"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" systemd/${pkgname}.{service,timer}
    install -Dm755 -t "${pkgdir}/usr/bin" clamav-unofficial-sigs.sh
    install -Dm644 "${srcdir}/clamav-unofficial-sigs.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/clamav-unofficial-sigs.conf"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/clamav-unofficial-sigs" LICENSE
}

# vim:set ts=4 sw=2 ft=sh et syn=sh ft=sh:
