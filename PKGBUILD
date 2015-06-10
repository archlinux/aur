# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=ircd-ratbox
pkgver=3.0.8
pkgrel=4
pkgdesc="An advanced, stable and fast ircd"
url="http://www.ratbox.org"
license=('GPL')
depends=('openssl' 'sqlite')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
install="${pkgname}.install"
backup=("etc/${pkgname}/ircd.motd")

source=("http://www.ratbox.org/download/${pkgname}-$pkgver.tar.bz2"
        "${pkgname}.service"
        "${pkgname}.conf")
sha512sums=('79f2881b84d874e35b34065a8e2d05241989d611c762b56c70e04e82a5a435d082118efae33900bd45bfb0fa23394f880e37027b6e9cbcd1a2e89a31960f4c37'
            '2d2875c4d591ccea3524b20e4f5f1a340916d9d939bcbadc71c49ec35694abfa3759b7d6eb549df6bcc2b1cfab17876e6de5b6f2692462e04fe18a114314ba7d'
            '31e3719eb994e269c6ff3f3cc437674b72c8f621004feb8557c7d62bfad7d1d6def5ae56413c3eda4f7f51ed50a4c54910c5c64fd7da96b091733ecd3db0bde8')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr/share/${pkgname} \
    --with-confdir=/etc/${pkgname} \
    --with-logdir=/var/log/${pkgname} \
    --bindir=/usr/bin

    make
    cd contrib
    make
}

package() {
    install -d "${pkgdir}/etc/${pkgname}"
    install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 ${pkgname}.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    install -d "${pkgdir}/usr/share/${pkgname}/modules/contrib/"
    cp contrib/.libs/*.so "${pkgdir}/usr/share/${pkgname}/modules/contrib/"
}
