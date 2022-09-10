# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula-client
pkgver=13.0.1
pkgrel=1
pkgdesc="Enterprise ready, network based backup program"
url="https://www.bacula.org"
arch=('x86_64')
license=('AGPL3')
depends=('openssl')
conflicts=('bacula')
provides=("bacula-fd=${pkgver}")
backup=(
    'etc/bacula/bconsole.conf'
    'etc/bacula/bacula-fd.conf'
)
# Bacula 4096 Distribution Verification Key (www.bacula.org) <kern@bacula.org>
validpgpkeys=('5235F5B668D81DB61704A82DC0BE2A5FE9DF3643')
source=(
    "https://downloads.sourceforge.net/project/bacula/bacula/${pkgver}/bacula-${pkgver}.tar.gz"{,.sig}
    'bacula-fd.service'
)
sha256sums=('d63848d695ac15c1ccfc117892753314bcb9232a852c40e32cca88c0e918978a'
            'SKIP'
            '37cdab95a99142a7e8494f0a49e54a5bfb1dca28561d0ce70ea64bf98e0c50fd')

build() {
    cd bacula-${pkgver}/

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-client-only \
        --with-systemd=/usr/lib/systemd/system/ \
        --sysconfdir=/etc/bacula \
        --with-scriptdir=/etc/bacula/scripts

    make
}

package() {
    cd bacula-${pkgver}/

    make DESTDIR="${pkgdir}" install

    # we do not take the service file provided by bacula package
    # as it needs too much customization
    install -D -m0644 "${srcdir}/bacula-fd.service" "${pkgdir}/usr/lib/systemd/system/bacula-fd.service"
}
