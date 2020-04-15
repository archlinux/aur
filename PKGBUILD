# Maintainer: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=mpdas
pkgver=0.4.5
pkgrel=2
pkgdesc="An AudioScrobbler client for MPD written in C++."
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
url="http://50hz.ws/mpdas/"
depends=('libmpdclient' 'curl')
backup=('etc/mpdasrc')
install=mpdas.install
source=("https://github.com/hrkfdn/${pkgname}/archive/${pkgver}.tar.gz"
        'mpdas.service')
sha256sums=('c9103d7b897e76cd11a669e1c062d74cb73574efc7ba87de3b04304464e8a9ca'
            'bf24d12b431f1ab58cfc8c24624eeef4928ed520c0e317b2b09519d8e2f0e3fc')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}

    sed -i Makefile \
        -e 's|install -m 644|install -Dm644|' \
        -e 's|install mpdas ${PREFIX}/bin|install -Dm755 mpdas ${PREFIX}/bin/mpdas|'
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make PREFIX=/usr CONFIG=/etc
}

package() {
    cd ${pkgname}-${pkgver}

    make install PREFIX=${pkgdir}/usr MANPREFIX=${pkgdir}/usr/share/man/man1

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 mpdasrc.example ${pkgdir}/etc/mpdasrc

    install -Dm644 ${srcdir}/mpdas.service ${pkgdir}/usr/lib/systemd/user/mpdas.service
}

# vim: ft=sh
