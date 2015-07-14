# Maintainer: Igor Lakic aka trzalica <trzalica87 at gmail dot com>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_name=php-apache
_base=php
pkgname=php-apache22
pkgver=5.6.11
pkgrel=1
pkgdesc='Apache SAPI for PHP'
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
depends=('php' 'apache22')
makedepends=('apache22' 'imap' 'postgresql-libs' 'libldap' 'postfix' 
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds' 'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'gd' 
             'icu'
             'curl' 'libxslt' 'openssl' 'db' 'gmp' 'systemd')
backup=('etc/httpd/conf/extra/php5_module.conf')
provides=("$_name=$pkgver")
conflicts=("$_name")
source=("http://www.php.net/distributions/${_base}-${pkgver}.tar.gz"
        'php.ini.patch'
        'apache.conf'
        'php-fpm.conf.in.patch')
md5sums=('c4d55105e07c9f75dcbacef8000f7992'
         '0e5a8cf6e851b2c68dd638ce63f82647'
         'dec2cbaad64e3abf4f0ec70e1de4e8e9'
         'b9d7ead46639bbcd6c6d6e8b4876ed7f')

prepare() {
	cd "${srcdir}/${_base}-${pkgver}"

	patch -p0 -i "${srcdir}/php.ini.patch"
	patch -p0 -i "${srcdir}/php-fpm.conf.in.patch"
	# Just because our Apache 2.4 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
	# Let's supress this behaviour and build a SAPI that works fine with the prefork MPM.
	# php-apache22 note: causes no harm(?) so leave it
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

	local _phpextensions="--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd-native-ttf \
		--enable-intl=shared \
		--enable-mbstring \
		--enable-opcache \
		--enable-phar=shared \
		--enable-posix=shared \
		--enable-shmop=shared \
		--enable-soap=shared \
		--enable-sockets=shared \
		--enable-sysvmsg=shared \
		--enable-sysvsem=shared \
		--enable-sysvshm=shared \
		--enable-zip=shared \
		--with-bz2=shared \
		--with-curl=shared \
		--with-db4=/usr \
		--with-enchant=shared,/usr \
		--with-fpm-systemd \
		--with-freetype-dir=/usr \
		--with-xpm-dir=/usr \
		--with-gd=shared,/usr \
		--with-gdbm \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-icu-dir=/usr \
		--with-imap-ssl \
		--with-imap=shared \
		--with-jpeg-dir=/usr \
		--with-vpx-dir=/usr \
		--with-ldap=shared \
		--with-ldap-sasl \
		--with-libzip \
		--with-mcrypt=shared \
		--with-mhash \
		--with-mssql=shared \
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysql=shared,mysqlnd \
		--with-mysqli=shared,mysqlnd \
		--with-openssl=shared \
		--with-pcre-regex=/usr \
		--with-pdo-mysql=shared,mysqlnd \
		--with-pdo-odbc=shared,unixODBC,/usr \
		--with-pdo-pgsql=shared \
		--with-pdo-sqlite=shared,/usr \
		--with-pgsql=shared \
		--with-png-dir=/usr \
		--with-pspell=shared \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		--with-kerberos \
		"

	# Don't think these are needed since we're only making the php-apache(22) package, but i cba to check so i'm leaving them. Certainly isn't going to hurt anything.
	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/share/pear
	export PEAR_INSTALLDIR

	cd "${srcdir}/${_base}-${pkgver}"
	mkdir "${srcdir}/build-apache"
	cd "${srcdir}/build-apache"
	ln -s "../${_base}-${pkgver}/configure"
	./configure ${_phpconfig} \
		--disable-cli \
		--with-apxs2 \
		${_phpextensions}
	make
}


package() {
	install -D -m755 "${srcdir}/build-apache/libs/libphp5.so" "${pkgdir}/usr/lib/httpd/modules/libphp5.so"
	install -D -m644 "${srcdir}/apache.conf" "${pkgdir}/etc/httpd/conf/extra/php5_module.conf"
}
