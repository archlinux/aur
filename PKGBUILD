# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Sven Klomp <mail at klomp dot eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname='php7-homegear'
pkgdesc='Patched version of PHP for Homegear'
pkgver=7.2.0
_pthreadversion=b3e691f25cd659bcdb504b61e8da235251cb3b5a
_pkgbase=php
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('PHP')
url='http://www.php.net'
depends=('gmp' 'enchant' 'libedit' 'libmcrypt' 'libzip' 'libxml2' 'openssl')
source=("http://www.php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        "https://github.com/krakjoe/pthreads/archive/${_pthreadversion}.tar.gz")
sha512sums=('828d38727edde0dbc6483add6cdc21d33527b887bffaedad2d7f53e25d58a6f661ac341a23db02741bc37248d161aaffd72026dd8ef85ac851594c127d6c0133'
            '748894d295d8c5db57261ac0317a43fc49e6365f712be6916d765543341fb622ef37e4ee7113daaafe533c485c127208262c53e52480421385f6c6608449edb5')
options=(!emptydirs)

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}/ext"

	if [ ! -d "pthreads" ]; then
		mv "${srcdir}/pthreads-${_pthreadversion}" pthreads
		sed -i 's/{ZEND_STRL("cli")}/{ZEND_STRL("homegear")}/g' pthreads/php_pthreads.c
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
                --with-enchant=shared,/usr \
                --enable-exif \
                --with-gettext=/usr \
                --with-gmp=/usr/include \
                --enable-fileinfo \
                --enable-filter \
                --enable-ftp \
                --enable-hash \
                --enable-json \
                --with-libzip \
                --enable-maintainer-zts \
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
                --enable-pdo

	make
}



package() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	make INSTALL_ROOT="${pkgdir}" install

	mv ${pkgdir}/usr/include/php7-homegear/php/* ${pkgdir}/usr/include/php7-homegear/
	install -d -m755 ${pkgdir}/usr/lib
	mv ${pkgdir}/usr/lib/homegear/php/lib/libphp7.a ${pkgdir}/usr/lib/libphp7-homegear.a

    rm -r ${pkgdir}/usr/lib/homegear
    rm -r ${pkgdir}/man
}
