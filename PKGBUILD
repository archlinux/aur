# Maintainer: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=mpdas
pkgver=0.4.3
pkgrel=1
pkgdesc="An AudioScrobbler client for MPD written in C++."
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
url="http://50hz.ws/mpdas/"
depends=('libmpdclient' 'curl')
backup=('etc/mpdasrc')
install=mpdas.install
source=("https://github.com/hrkfdn/${pkgname}/archive/${pkgver}.tar.gz"
        'mpdas.service')
sha256sums=('069e368bde35b2b3bd79439052c863a0f8c3b25ed454b5ab51f84fa6878b674e'
            '0a98de8f69da7cb34dcc4747d4d1bb015d6065779103db724a309b400c3cccb8')

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
