# Maintainer: Niklas <dev@n1klas.net>
# Contributor: Sven Klomp <mail at klomp dot eu>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname='php7-homegear'
pkgdesc='Patched version of PHP for Homegear'
pkgver=7.2.5
_pthreadversion=a949a0447a187781d64faafc7422ab5f8874bb2a
_pkgbase=php
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('PHP')
url='http://www.php.net'
depends=('gmp' 'enchant' 'libedit' 'libmcrypt' 'libzip' 'libxml2' 'openssl')
source=("http://www.php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        "https://github.com/krakjoe/pthreads/archive/${_pthreadversion}.tar.gz"
        'enchant-2.patch')
sha512sums=('1d49fc6e47d2e86d4fd62396e558965502f44cc8f72459bb0d406e157298cac67703b219837952da11122722d9fa8cb4cda8ef66ddf063cb063859db34110f58'
            '7d80bfef5f7c0fdbc3d0db6e28a0d3bbc6bca8af17052675401a44b98361aa956bca60f5823b0f273f0fa9b2ef43dd21afeda497475baa09d01aab29dddfb6b5'
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
