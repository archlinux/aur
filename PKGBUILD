# Maintainer: Janusz Lewandowski <lew21@xtreeme.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_base=php
pkgname=php-apache25
pkgver=5.6.10
pkgrel=1
pkgdesc='Apache 2.5 SAPI for PHP'
depends=('php' 'apache=2.5')
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache=2.5' 'zlib' 'pcre' 'libxml2' 'openssl' 'xz')
checkdepends=('procps-ng')
source=("http://www.php.net/distributions/${_base}-${pkgver}.tar.xz"
        'apache.conf')
md5sums=('4631ef265253d2f496b3574d297f26ed'
         'dec2cbaad64e3abf4f0ec70e1de4e8e9')

prepare() {
	cd ${srcdir}/${_base}-${pkgver}

	# Just because our Apache 2.4 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
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
		"

	local _phpextensions=""

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/share/pear
	export PEAR_INSTALLDIR

	cd ${srcdir}/${_base}-${pkgver}

	# apache
	mkdir -p ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	ln -sf ../${_base}-${pkgver}/configure
	./configure ${_phpconfig} \
		--disable-cli \
		--with-apxs2 \
		${_phpextensions}
	make

}

package() {
	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/libphp5.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/usr/lib/httpd/conf/extra/php5.conf
}
