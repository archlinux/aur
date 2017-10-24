# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Sven Klomp <mail at klomp dot eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname='php7-homegear'
pkgdesc='Patched version of PHP for Homegear'
pkgver=7.2.0rc4
_pthreadversion=d596cee020843fd896e40f21a71c44ca96dd4240
_pkgbase=php
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('PHP')
url='http://www.php.net'
depends=('gmp' 'enchant' 'libmcrypt' 'libedit' 'openssl' 'libxml2')
source=(#"http://www.php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        "https://downloads.php.net/~remi/php-${pkgver^^}.tar.gz"
        "https://github.com/krakjoe/pthreads/archive/${_pthreadversion}.tar.gz")
sha512sums=('c9f1795078a09867620a988909cd3e701d99e6349caff29037da6111739f8db62228be27a36a8c7e420683f3e4de319d49844654713573aa7210f812e777ef34'
            'ccecf3483c6ebc71dbfebb270e4909f251328b01062a4f90a8bdbd0caee74a996c5afb90b4db18a56ba64802276475f50a3f3a589e3e1bcef01eb70fe98bf23d')
replaces=('php7-homegear')
options=(!emptydirs)

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver^^}/ext"

	if [ ! -d "pthreads" ]; then
		mv "${srcdir}/pthreads-${_pthreadversion}" pthreads
		sed -i 's/{ZEND_STRL("cli")}/{ZEND_STRL("homegear")}/g' pthreads/php_pthreads.c
	fi
}

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver^^}"

    autoconf

    ./configure --prefix=/usr/lib/homegear/php \
                --enable-embed=static \
                --with-config-file-path=/etc/homegear \
                --with-config-file-scan-dir=/etc/homegear/php.conf.d \
                --includedir=/usr/include/php7-homegear \
                --libdir=/usr/lib/homegear/php \
                --libexecdir=${prefix}/lib \
                --datadir=${prefix}/share \
                --program-suffix=-homegear \
                --sysconfdir=/etc/homegear \
                --localstatedir=/var \
                --mandir=${prefix}/man \
                --disable-debug \
                --disable-rpath \
                --with-pic \
                --with-layout=GNU \
                --enable-bcmath \
                --enable-calendar \
                --enable-ctype \
                --enable-dba \
                --without-gdbm \
                --without-qdbm \
                --enable-inifile \
                --enable-flatfile \
                --enable-dom \
                --with-enchant=/usr \
                --enable-exif \
                --with-gettext=/usr \
                --with-gmp=/usr/include \
                --enable-fileinfo \
                --enable-filter \
                --enable-ftp \
                --enable-hash \
                --enable-json \
                --enable-pdo \
                --enable-mbregex \
                --enable-mbregex-backtrack \
                --enable-mbstring \
                --disable-opcache \
                --enable-phar \
                --enable-posix \
                --with-mysqli=mysqlnd \
                --with-zlib-dir=/usr \
                --with-openssl \
                --with-libedit=/usr \
                --enable-libxml \
                --enable-session \
                --enable-simplexml \
                --enable-pthreads \
                --with-xmlrpc \
                --enable-soap \
                --enable-sockets \
                --enable-tokenizer \
                --enable-xml \
                --enable-xmlreader \
                --enable-xmlwriter \
                --with-mhash=yes \
                --enable-sysvmsg \
                --enable-sysvsem \
                --enable-sysvshm \
                --enable-zip \
                --disable-cli \
                --disable-cgi \
                --enable-pcntl \
                --enable-maintainer-zts

	make
}



package() {
	cd ${srcdir}/${_pkgbase}-${pkgver^^}

	make INSTALL_ROOT="${pkgdir}" install

	mv ${pkgdir}/usr/include/php7-homegear/php/* ${pkgdir}/usr/include/php7-homegear/
	install -d -m755 ${pkgdir}/usr/lib
	mv ${pkgdir}/usr/lib/homegear/php/lib/libphp7.a ${pkgdir}/usr/lib/libphp7-homegear.a

    rm -r ${pkgdir}/usr/lib/homegear
    rm -r ${pkgdir}/man
}
