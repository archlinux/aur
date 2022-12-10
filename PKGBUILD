# Maintainer: Dennis Wölfing <denniswoelfing at gmx dot de>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=mandoc-noconflict
pkgver=1.14.6
pkgrel=1
pkgdesc='A suite of tools compiling mdoc from the OpenBSD project - does not conflict with man-db'
arch=('x86_64')
url='https://mandoc.bsd.lv'
license=('ISC')
depends=('zlib')
provides=('mandoc')
conflicts=('mandoc')
source=("${url}/snapshots/mandoc-${pkgver}.tar.gz"
        'configure.local'
        'mandoc.service'
        'mandoc.timer')
sha256sums=('8bf0d570f01e70a6e124884088870cbed7537f36328d512909eb10cd53179d9c'
            '23cd0e478aa08890bb2c18ff376e9c7ec84e45693f1b5457ecf7615f9c032a18'
            '2091411d5f87a3c371a5ba74b4773d1e454046446fa2cb045485979e52419bb6'
            '74d6a02b97a17fffddcc0a3dc830e811348b1f6c6b84f867882c776d50f00ea4')

prepare() {
    cd "${srcdir}"/mandoc-${pkgver}

    cp ../configure.local .
}

build() {
    cd "${srcdir}"/mandoc-${pkgver}

    # apply CFLAGS and LDFLAGS from makepkg.conf
    {
        echo "CFLAGS=${CFLAGS@Q}"
        echo "LDFLAGS=${LDFLAGS@Q}"
    } >> configure.local

    ./configure
    make
}

package() {
    cd "${srcdir}"/mandoc-${pkgver}

    DESTDIR="${pkgdir}" make install
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    install -Dm644 "${srcdir}"/mandoc.timer "${pkgdir}"/usr/lib/systemd/system/mandoc.timer
    install -Dm644 "${srcdir}"/mandoc.service "${pkgdir}"/usr/lib/systemd/system/mandoc.service
    install -dm755 "${pkgdir}"/usr/lib/systemd/system/multi-user.target.wants
    ln -s ../mandoc.timer "${pkgdir}"/usr/lib/systemd/system/multi-user.target.wants/mandoc.timer
}
