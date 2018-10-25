# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Sven Klomp <mail at klomp dot eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=php-homegear
pkgver=7.2.11
_pthreadversion=e25675dee989a2e15b81da6c0e215d22bacff86a
_pkgbase=php
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="Patched version of PHP for Homegear"
license=('PHP')
url="http://www.php.net"
depends=('gmp' 'enchant' 'libedit' 'libmcrypt' 'libzip' 'libxml2' 'openssl')
replaces=('php7-homegear')
provides=('php7-homegear')
source=("http://www.php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
        "https://github.com/krakjoe/pthreads/archive/${_pthreadversion}.tar.gz"
        'enchant-2.patch')
sha512sums=('0cd8578147d17d612e013dfc22b73977719177058b39c7b61dd0bfdfb8c2441aba78af49f58c824f7e66c89b5ad201c36fafb89ccf1e2d20f19b79d6a8fed7e5'
            'SKIP'
            '3c1b83e439045cf87d04c21952d9ff475a3ae079d8e48c49cccc1a83e892582415c0ec2eccd85e30bf56f7ced0344e1528e3db2512bd9ab70fa9479d225b144b'
            '89993be67988f6db09e1102214a41fdb7223274bc6ca71f1defc5fe9548d832485f7133b8ba82860f04da00c7f655d701c7550460c0172a2a2d31ef3f3f96038')
validpgpkeys=('B1B44D8F021E4E2D6021E995DC9FF8D3EE5AF27F'
              '1729F83938DA44E27BA0F4D3DBDB397470D12172')
options=(!emptydirs)

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    patch -p1 -i "${srcdir}/enchant-2.patch"

    if [ ! -d "ext/pthreads" ]; then
        mv "${srcdir}/pthreads-${_pthreadversion}" ext/pthreads
        sed -i 's/{ZEND_STRL("cli")}/{ZEND_STRL("homegear")}/g' ext/pthreads/php_pthreads.c
    fi
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    autoconf

    ./configure --prefix=/usr/lib/homegear/php \
                --enable-embed=static \
                --with-config-file-path=/etc/homegear \
                --with-config-file-scan-dir=/etc/homegear/php.conf.d \
                --includedir=/usr/include/php-homegear \
                --libdir=/usr/lib/homegear/php \
                --libexecdir=${prefix}/lib \
                --datadir=${prefix}/share \
                --program-suffix=-homegear \
                --sysconfdir=/etc/homegear \
                --localstatedir=/var \
                --mandir=${prefix}/man \
                --disable-debug \
                --disable-opcache \
                --disable-rpath \
                --enable-bcmath \
                --enable-calendar \
                --enable-ctype \
                --enable-dba \
                --enable-inifile \
                --enable-flatfile \
                --enable-dom \
                --enable-exif \
                --enable-fileinfo \
                --enable-filter \
                --enable-ftp \
                --enable-hash \
                --enable-json \
                --enable-maintainer-zts \
                --enable-mbregex \
                --enable-mbregex-backtrack \
                --enable-mbstring \
                --enable-phar \
                --enable-posix \
                --enable-libxml \
                --enable-session \
                --enable-simplexml \
                --enable-soap \
                --enable-sockets \
                --enable-tokenizer \
                --enable-xml \
                --enable-xmlreader \
                --enable-xmlwriter \
                --enable-sysvmsg \
                --enable-sysvsem \
                --enable-sysvshm \
                --enable-zip=shared \
                --disable-cli \
                --disable-cgi \
                --enable-pcntl \
                --enable-pdo \
                --with-enchant=shared,/usr \
                --with-gettext=/usr \
                --with-gmp=/usr/include \
                --with-mhash=yes \
                --with-mysqli=mysqlnd \
                --with-openssl \
                --with-layout=GNU \
                --with-libedit=/usr \
                --with-pic \
                --with-xmlrpc \
                --with-zlib \
                --without-gdbm \
                --without-qdbm

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    make INSTALL_ROOT="${pkgdir}" install

    mv "${pkgdir}/usr/include/php-homegear/php/"* "${pkgdir}/usr/include/php-homegear/"
    install -d -m755 "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/lib/homegear/php/lib/libphp7.a" "${pkgdir}/usr/lib/libphp-homegear.a"

    rm -r "${pkgdir}/usr/lib/homegear"
    rm -r "${pkgdir}/man"
}
