# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>

pkgname=php56-xdebug
_pkgbase="${pkgname#php56-}"
pkgver=2.5.3
_pkgver="$(echo "${pkgver}" | tr '[:lower:]' '[:upper:]')"
pkgrel=2
pkgdesc="php56 debugging extension"
arch=('x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php56>=5.6.17-3')
options=('!makeflags')
backup=('etc/php56/conf.d/xdebug.ini')
provides=("${_pkgbase}=${pkgver}-${pkgrel}" "php-${_pkgbase}=${pkgver}-${pkgrel}")
source=("http://www.xdebug.org/files/${_pkgbase}-${pkgver}.tgz"
        "xdebug.ini")
sha256sums=('4cce3d495243e92cd2e1d764a33188d60c85f0d2087d94d4203c354ea03530f4'
            '7c66883dc2ade69069ef84e30188b25630748aa9c8b0dd123727c00505421205')

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
