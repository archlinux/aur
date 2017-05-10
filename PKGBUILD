# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=amavisd-milter
pkgver=1.6.1
pkgrel=2
pkgdesc="sendmail milter for amavisd-new using the AM.PDP protocol"
arch=('i686' 'x86_64')
url="http://amavisd-milter.sourceforge.net/"
license=('BSD')
depends=('amavisd-new')
makedepends=('libmilter')
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz/download"
        'amavisd-milter.service')
sha512sums=('28f505a8e130e67decc6c6ff8526f82db24b1b27a11e69f1a112e3e6103f303d333743c2ceaf12bad86979c987cde64f41afb4794c1ca1222cf11a2c3b03c8a5'
            '0a07da1f1c1299ac26fc8ccd77919e4c5c69ea3e673c1d34f46f730899e2b4234784147fb9929e635a6dc7a40474ca0ba2f03785125ba5b37b1252eb986b4510')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # change upstream default paths (must match those of amavisd-new)
    sed -i 's|/var/amavis|/var/spool/amavis|g' "${pkgname}/amavisd-milter.8"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --sysconfdir=/etc/amavis \
        --localstatedir=/var/spool/amavis \
        --sharedstatedir=/usr/share
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    # license
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # systemd unit
    install -D -m644 "${srcdir}/amavisd-milter.service" "${pkgdir}/usr/lib/systemd/system/amavisd-milter.service"
}
