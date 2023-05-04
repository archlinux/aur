# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula-client
pkgver=13.0.3
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
b2sums=('c1053e784f995aa45f2810a8b1370211a6e42f9512c11e0290f059d0e39489c24d4a7951fa055a00ecd2c4acb44581cc220271952c6d477d15c86e0a7e8680f7'
        'SKIP'
        '40e2965c025f76c93d8e5c248b49177cbffc65b1afef620437f486132696730211df0b06b0c9bb5377acb4b57d897e4d0e4dc806fa0301c85f7cf9f771ee479a')

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
