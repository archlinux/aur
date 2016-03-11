# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_base=php
pkgname=php-apache25
pkgver=7.0.4
pkgrel=1
pkgdesc='Apache 2.5 SAPI for PHP'
depends=('php' 'apache=2.5')
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache=2.5' 'zlib' 'pcre' 'libxml2' 'openssl' 'xz')
checkdepends=('procps-ng')
source=("https://www.php.net/distributions/${_base}-${pkgver}.tar.xz"{,.asc}
        'apache.conf')
sha256sums=('584e0e374e357a71b6e95175a2947d787453afc7f9ab7c55651c10491c4df532' 'SKIP'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce')

prepare() {
	cd ${srcdir}/${_base}-${pkgver}

	# Just because our Apache 2.5 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
	# Let's supress this behaviour and build a SAPI that works fine with the prefork MPM.
	sed '/APACHE_THREADED_MPM=/d' -i sapi/apache2handler/config.m4 -i configure
}

build() {
	local _phpconfig="--srcdir=../${_base}-${pkgver} \
		--config-cache \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/php \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=/etc/php \
		--with-config-file-scan-dir=/etc/php/conf.d \
		--disable-rpath \
		--mandir=/usr/share/man \
		--without-pear \
		--enable-zend-signals \
		"

	local _phpextensions="
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysqli=shared,mysqlnd \
		--with-openssl \
		--with-pdo-mysql=shared,mysqlnd"

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR

	cd ${srcdir}/${_base}-${pkgver}

	# apache
	mkdir -p ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	ln -sf ../${_base}-${pkgver}/configure
	./configure ${_phpconfig} \
		--with-apxs2 \
		${_phpextensions}
	make

}

package() {
	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/libphp7.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/usr/lib/httpd/conf/extra/php7.conf
}
