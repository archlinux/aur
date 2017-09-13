# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-xdebug
_pkgbase="${pkgname#php56-}"
pkgver=2.5.5
_pkgver="$(echo "${pkgver}" | tr '[:lower:]' '[:upper:]')"
pkgrel=1
pkgdesc="php56 debugging extension"
arch=('x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php56>=5.6.17-3')
options=('!makeflags')
backup=('etc/php56/conf.d/xdebug.ini')
provides=("${_pkgbase}=${pkgver}-${pkgrel}" "php-${_pkgbase}=${pkgver}-${pkgrel}")
source=("https://www.xdebug.org/files/${_pkgbase}-${pkgver}.tgz"
        "xdebug.ini")
sha512sums=('9faab421bd90c03734c047d8c6dcc021c8bc665eb36781c692f194d04c7dca24fe1eb920ca8dc407e5bf4ae0912c4b917587f940f34b07171a8881d4cf8695d1'
            '738e6939a129a557d307a1659dfdfb0a0ded783b31c6c9a85f18cfa380a13afef4386cccce5a9ad3e1afcc66a2dedbebf29fa96d91f618a76af4a4d9e504f74e')

build() {
    cd "${srcdir}/${_pkgbase}-${_pkgver}"
    phpize56
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php56 \
        --with-php-config=/usr/bin/php-config56 \
        --localstatedir=/var
    make

    cd "${srcdir}/${_pkgbase}-${_pkgver}/debugclient"
    ./buildconf
    ./configure \
        --config-cache \
        --sysconfdir=/etc/php56 \
        --with-php-config=/usr/bin/php-config56 \
        --localstatedir=/var
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${_pkgver}"
    make test NO_INTERACTION=1 REPORT_EXIT_STATUS=1
}

package() {
    cd "${srcdir}/${_pkgbase}-${_pkgver}"
    make INSTALL_ROOT="$pkgdir" install
    install -D -m644 "${srcdir}/xdebug.ini" "${pkgdir}/etc/php56/conf.d/xdebug.ini"

    install -D -m755 "./debugclient/debugclient" "${pkgdir}/usr/bin/debugclient56"
}
