pkgbase=php7
_pkgbase=php
pkgname=('php7'
         'php7-cgi'
         'php7-apache'
         'php7-fpm'
         'php7-embed'
         'php7-phpdbg'
         'php7-enchant'
         'php7-gd'
         'php7-intl'
         'php7-ldap'
         'php7-mcrypt'
         'php7-odbc'
         'php7-pgsql'
         'php7-pspell'
         'php7-snmp'
         'php7-sqlite'
         'php7-tidy'
         'php7-xsl')

pkgver=7.0.0beta1
pkgrel=1
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'imap' 'postgresql-libs' 'libldap' 'postfix'
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'gd' 'icu'
             'curl' 'libxslt' 'openssl' 'db' 'gmp' 'systemd')

source=("https://downloads.php.net/~ab/php-${pkgver}.tar.xz"
        'php.ini.patch' 'apache.conf'
        'php-fpm.service' 'php-fpm.tmpfiles')
md5sums=('e18aaad357f7bb8e416c300d64625fb8'
         'd84cb6f3aa24003f326880bc7a4bdd6c'
         '0677a10d2e721472d6fccb470356b322'
         'cc2940f5312ba42e7aa1ddfab74b84c4'
         'c60343df74f8e1afb13b084d5c0e47ed')
validpgpkeys=('6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/php.ini.patch
	# Just because our Apache 2.4 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
	# Let's supress this behaviour and build a SAPI that works fine with the prefork MPM.
	sed '/APACHE_THREADED_MPM=/d' -i sapi/apache2handler/config.m4 -i configure
}

build() {
	local _phpconfig="--srcdir=../${_pkgbase}-${pkgver} \
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
        --with-kerberos \
		"

	local _phpextensions="--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd-native-ttf \
		--enable-intl=shared \
		--enable-mbstring \
		--enable-mysqlnd \
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
		--with-mysql-sock=/run/mysqld/mysqld.sock \
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
		"

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=/usr/share/pear
	export PEAR_INSTALLDIR

	cd ${srcdir}/${_pkgbase}-${pkgver}

	# php
	mkdir -p ${srcdir}/build-php
	cd ${srcdir}/build-php
	ln -sf ../${_pkgbase}-${pkgver}/configure
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		${_phpextensions}
	make

	# cgi and fcgi
	# reuse the previous run; this will save us a lot of time
	cp -a ${srcdir}/build-php ${srcdir}/build-cgi
	cd ${srcdir}/build-cgi
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-cgi \
		${_phpextensions}
	make

	# apache
	cp -a ${srcdir}/build-php ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	./configure ${_phpconfig} \
		--disable-cli \
		--with-apxs2 \
		${_phpextensions}
	make

	# fpm
	cp -a ${srcdir}/build-php ${srcdir}/build-fpm
	cd ${srcdir}/build-fpm
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-fpm \
		--with-fpm-user=http \
		--with-fpm-group=http \
		${_phpextensions}
	make

	# embed
	cp -a ${srcdir}/build-php ${srcdir}/build-embed
	cd ${srcdir}/build-embed
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-embed=shared \
		${_phpextensions}
	make

	# phpdbg
	cp -a ${srcdir}/build-php ${srcdir}/build-phpdbg
	cd ${srcdir}/build-phpdbg
	./configure ${_phpconfig} \
		--disable-cli \
		--disable-cgi \
		--with-readline \
		--enable-phpdbg \
		${_phpextensions}
	make
}

# check() {
# 	cd ${srcdir}/build-php
# 	export SNMP_TIMEOUT=1
# 	export SNMP_RETRIES=0
# 	export NO_INTERACTION=1
# 	make test
# 	echo
# }

package_php7() {
	pkgdesc='An HTML-embedded scripting language'
	depends=('pcre' 'libxml2' 'curl' 'libzip')
	backup=('etc/php/php.ini')
    provides=('php')
    conflicts=('php')
	cd ${srcdir}/build-php
	make -j1 INSTALL_ROOT=${pkgdir} install
	install -d -m755 ${pkgdir}/usr/share/pear
	# install php.ini
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/php/php.ini
	install -d -m755 ${pkgdir}/etc/php/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/php/modules/{enchant,gd,intl,ldap,mcrypt,odbc,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include
	# fix broken link
	ln -sf phar.phar ${pkgdir}/usr/bin/phar
}

package_php7-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=('php')
    provides=('php-cgi')
    conflicts=('php-cgi')

	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/usr/bin/php-cgi
}

package_php7-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=('php' 'apache')
	backup=('etc/httpd/conf/extra/php7_module.conf')
    provides=('php-apache')
    conflicts=('php-apache')

	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/libphp7.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php7_module.conf
}

package_php7-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=('php' 'systemd')
	backup=('etc/php/php-fpm.conf')
	install='php-fpm.install'
    provides=('php-fpm')
    conflicts=('php-fpm')

	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/usr/bin/php-fpm
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.8 ${pkgdir}/usr/share/man/man8/php-fpm.8
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/etc/php/php-fpm.conf
	install -d -m755 ${pkgdir}/etc/php/fpm.d
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/php-fpm.conf
	install -D -m644 ${srcdir}/php-fpm.service ${pkgdir}/usr/lib/systemd/system/php-fpm.service
}

package_php7-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=('php')
    provides=('php-embed')
    conflicts=('php-embed')

	install -D -m755 ${srcdir}/build-embed/libs/libphp7.so ${pkgdir}/usr/lib/libphp7.so
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/sapi/embed/php_embed.h ${pkgdir}/usr/include/php/sapi/embed/php_embed.h
}

package_php7-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=('php')
    provides=('php-phpdbg')
    conflicts=('php-phpdbg')

	install -D -m755 ${srcdir}/build-phpdbg/sapi/phpdbg/phpdbg ${pkgdir}/usr/bin/phpdbg
}

package_php7-enchant() {
	pkgdesc='enchant module for PHP'
	depends=('php' 'enchant')
    provides=('php-enchant')
    conflicts=('php-enchant')

	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/usr/lib/php/modules/enchant.so
}

package_php7-gd() {
	pkgdesc='gd module for PHP'
	depends=('php' 'gd')
    provides=('php-gd')
    conflicts=('php-gd')

	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/usr/lib/php/modules/gd.so
}

package_php7-intl() {
	pkgdesc='intl module for PHP'
	depends=('php' 'icu')
    provides=('php-intl')
    conflicts=('php-intl')

	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/usr/lib/php/modules/intl.so
}

package_php7-ldap() {
	pkgdesc='ldap module for PHP'
	depends=('php' 'libldap')
    provides=('php-ldap')
    conflicts=('php-ldap')

	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/usr/lib/php/modules/ldap.so
}

package_php7-mcrypt() {
	pkgdesc='mcrypt module for PHP'
	depends=('php' 'libmcrypt' 'libltdl')
    provides=('php-mcrypt')
    conflicts=('php-mcrypt')

	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/usr/lib/php/modules/mcrypt.so
}


package_php7-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=('php' 'unixodbc')
    provides=('php-odbc')
    conflicts=('php-odbc')

	install -D -m755 ${srcdir}/build-php/modules/odbc.so ${pkgdir}/usr/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_odbc.so ${pkgdir}/usr/lib/php/modules/pdo_odbc.so
}

package_php7-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=('php' 'postgresql-libs')
    provides=('php-pgsql')
    conflicts=('php-pgsql')

	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/usr/lib/php/modules/pdo_pgsql.so
}

package_php7-pspell() {
	pkgdesc='pspell module for PHP'
	depends=('php' 'aspell')
    provides=('php-pspell')
    conflicts=('php-pspell')

	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/usr/lib/php/modules/pspell.so
}

package_php7-snmp() {
	pkgdesc='snmp module for PHP'
	depends=('php' 'net-snmp')
    provides=('php-snmp')
    conflicts=('php-snmp')

	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/usr/lib/php/modules/snmp.so
}

package_php7-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=('php' 'sqlite')
    provides=('php-sqlite')
    conflicts=('php-sqlite')

	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/usr/lib/php/modules/pdo_sqlite.so
}

package_php7-tidy() {
	pkgdesc='tidy module for PHP'
	depends=('php' 'tidyhtml')
    provides=('php-tidy')
    conflicts=('php-tidy')

	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/usr/lib/php/modules/tidy.so
}

package_php7-xsl() {
	pkgdesc='xsl module for PHP'
	depends=('php' 'libxslt')
    provides=('php-xsl')
    conflicts=('php-xsl')

	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/usr/lib/php/modules/xsl.so
}

