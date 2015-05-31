# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=phpredis-git
pkgrel=1
pkgver=2.2.5.r11.gb9a16b5
pkgdesc="A PHP extension for Redis"
arch=('i686' 'x86_64')
url="https://github.com/nicolasff/phpredis"
license=('PHP')
makedepends=('git')
depends=('php')
_ininame="phpredis.ini"
_inifile="etc/php/conf.d/$_ininame"
backup=("$_inifile")
source=(git+https://github.com/nicolasff/phpredis.git ${_ininame})

md5sums=('SKIP'
         '1fc22a23c6b24a223dd235a15d5e194f')
         
pkgver() {
    cd "${srcdir}/phpredis"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/phpredis"

    phpize
    ./configure --prefix=/usr --enable-redis
    make
    TEST_PHP_ARGS="-q" make test
}

package() {
    cd "${srcdir}/phpredis"

    make INSTALL_ROOT="${pkgdir}" install
    install -vDm644 "${srcdir}/${_ininame}" "${pkgdir}/${_inifile}"
}
