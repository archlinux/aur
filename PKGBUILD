# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Sven Klomp <mail at klomp dot eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname='php7-homegear'
pkgdesc='Patched version of PHP for Homegear'
pkgver=7.2.2
_pthreadversion=64fff4f6aeadbcb5da2713304e00b9135cb296fd
_pkgbase=php
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('PHP')
url='http://www.php.net'
depends=('gmp' 'enchant' 'libedit' 'libmcrypt' 'libzip' 'libxml2' 'openssl')
source=("http://www.php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        "https://github.com/krakjoe/pthreads/archive/${_pthreadversion}.tar.gz"
        'enchant-2.patch')
sha512sums=('36a3565161fc481307ac3e76c8d2ccc457c265bf510f085be1907835c7da7c747a0876502192d77bd664f94a584a1b149deee2600c650481fbedbf02d72d5fd0'
            '68d6c6c863a9cebee15eb8480f927b49b5c52fe28c3a30342a81bcda5f009fcc21d3888e73444cc3d1da2877410719180c0668c60c462e7f2bd07670c7b04057'
            '89993be67988f6db09e1102214a41fdb7223274bc6ca71f1defc5fe9548d832485f7133b8ba82860f04da00c7f655d701c7550460c0172a2a2d31ef3f3f96038')
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
                --includedir=/usr/include/php7-homegear \
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

	mv "${pkgdir}/usr/include/php7-homegear/php/"* "${pkgdir}/usr/include/php7-homegear/"
	install -d -m755 "${pkgdir}/usr/lib"
	mv "${pkgdir}/usr/lib/homegear/php/lib/libphp7.a" "${pkgdir}/usr/lib/libphp7-homegear.a"

    rm -r "${pkgdir}/usr/lib/homegear"
    rm -r "${pkgdir}/man"
}
