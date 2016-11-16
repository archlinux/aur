# Maintainer: Aleksey Vasilenko <aleksey.vasilenko@gmail.com>

pkgbase=php-zts
pkgname=('php-zts'
         'php-zts-cgi'
         'php-zts-apache'
         'php-zts-fpm'
         'php-zts-embed'
         'php-zts-phpdbg'
         'php-zts-dblib'
         'php-zts-enchant'
         'php-zts-gd'
         'php-zts-imap'
         'php-zts-intl'
         'php-zts-mcrypt'
         'php-zts-odbc'
         'php-zts-pgsql'
         'php-zts-pspell'
         'php-zts-snmp'
         'php-zts-sqlite'
         'php-zts-tidy'
         'php-zts-xsl')
pkgver=7.0.13
pkgrel=1
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds')
checkdepends=('procps-ng')
source=("http://www.php.net/distributions/php-${pkgver}.tar.xz"{,.asc}
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch')
sha256sums=('357ba7f93975d7d836abed0852dc3ed96a988af539e87750613294cbee82f1bf'
            'SKIP'
            '819f05d2fd5a75c96e93c863517ca77dbd021a1224dc2d8096f758fb2937df6a'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            '136e197384255420c73678aef812e70aa86320f6dbefcc5a952df1a65fdd53fa'
            '640dba0d960bfeaae9ad38d2826d3f6b5d6c175a4d3e16664eefff29141faad5'
            'd37ce253f1096df1702fe2b0272a0919e8a02cc9e05b868d5f54b506fc6ce0d3')
validpgpkeys=('1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763'
              '6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3')

prepare() {
	cd ${srcdir}/php-${pkgver}

	patch -p0 -i ${srcdir}/apache.patch
	patch -p0 -i ${srcdir}/php-fpm.patch
	patch -p0 -i ${srcdir}/php.ini.patch
}

build() {
	local _phpconfig="--srcdir=../php-${pkgver} \
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
		--enable-maintainer-zts \
		"

	local _phpextensions="\
		--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd-native-ttf \
		--enable-intl=shared \
		--enable-mbstring \
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
		--with-freetype-dir=/usr \
		--with-gd=shared,/usr \
		--with-gdbm \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-imap-ssl \
		--with-imap=shared \
		--with-kerberos=/usr \
		--with-ldap=shared \
		--with-ldap-sasl \
		--with-libzip \
		--with-mcrypt=shared \
		--with-mhash \
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysqli=shared,mysqlnd \
		--with-openssl \
		--with-pcre-regex=/usr \
		--with-pdo-dblib=shared,/usr \
		--with-pdo-mysql=shared,mysqlnd \
		--with-pdo-odbc=shared,unixODBC,/usr \
		--with-pdo-pgsql=shared \
		--with-pdo-sqlite=shared,/usr \
		--with-pgsql=shared \
		--with-pspell=shared \
		--with-readline \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		--enable-pcntl \
		"

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR

	mkdir ${srcdir}/build
	cd ${srcdir}/build
	ln -s ../php-${pkgver}/configure
	./configure ${_phpconfig} \
		--enable-cgi \
		--enable-fpm \
		--with-fpm-systemd \
		--with-fpm-acl \
		--with-fpm-user=http \
		--with-fpm-group=http \
		--enable-embed=shared \
		${_phpextensions}
	make

	# apache
	# reuse the previous run; this will save us a lot of time
	cp -a ${srcdir}/build ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	./configure ${_phpconfig} \
		--with-apxs2 \
		${_phpextensions}
	make

	# phpdbg
	cp -a ${srcdir}/build ${srcdir}/build-phpdbg
	cd ${srcdir}/build-phpdbg
	./configure ${_phpconfig} \
		--enable-phpdbg \
		${_phpextensions}
	make
}

check() {
	cd ${srcdir}/php-${pkgver}

	# Check if sendmail was configured correctly (FS#47600)
	${srcdir}/build/sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1

	${srcdir}/build/sapi/cli/php -n run-tests.php -n -P {tests,Zend}
}

package_php-zts() {
	pkgdesc='PHP with ZTS enabled'
	depends=('libxml2' 'curl' 'libzip')
	conflicts=('php')
	replaces=('php')
	provides=('php')
	backup=('etc/php/php.ini')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/php-${pkgver}/php.ini-production ${pkgdir}/etc/php/php.ini
	install -d -m755 ${pkgdir}/etc/php/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/php/modules/{enchant,gd,imap,intl,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include
}

package_php-zts-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=('php-zts')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php-zts-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=('php-zts' 'apache')
	backup=('etc/httpd/conf/extra/php7_module.conf')

	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/libphp7.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php7_module.conf
}

package_php-zts-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=('php-zts' 'systemd')
	backup=('etc/php/php-fpm.conf' 'etc/php/php-fpm.d/www.conf')
	install='php-fpm.install'
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/php-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/php-fpm.conf
}

package_php-zts-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=('php-zts' 'libsystemd')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
}

package_php-zts-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=('php-zts')
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php-zts-dblib() {
	pkgdesc='dblib module for PHP'
	depends=('php-zts' 'freetds')

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/php/modules/pdo_dblib.so
}

package_php-zts-enchant() {
	pkgdesc='enchant module for PHP'
	depends=('php-zts' 'enchant')

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/php/modules/enchant.so
}

package_php-zts-gd() {
	pkgdesc='gd module for PHP'
	depends=('php-zts' 'gd')

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/php/modules/gd.so
}

package_php-zts-imap() {
	pkgdesc='imap module for PHP'
	depends=('php-zts' 'c-client')

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/php/modules/imap.so
}

package_php-zts-intl() {
	pkgdesc='intl module for PHP'
	depends=('php-zts' 'icu')

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/php/modules/intl.so
}

package_php-zts-mcrypt() {
	pkgdesc='mcrypt module for PHP'
	depends=('php-zts' 'libmcrypt' 'libtool')

	install -D -m755 ${srcdir}/build/modules/mcrypt.so ${pkgdir}/usr/lib/php/modules/mcrypt.so
}

package_php-zts-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=('php-zts' 'unixodbc')

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/php/modules/pdo_odbc.so
}

package_php-zts-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=('php-zts' 'postgresql-libs')

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/php/modules/pdo_pgsql.so
}

package_php-zts-pspell() {
	pkgdesc='pspell module for PHP'
	depends=('php-zts' 'aspell')

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/php/modules/pspell.so
}

package_php-zts-snmp() {
	pkgdesc='snmp module for PHP'
	depends=('php-zts' 'net-snmp')

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/php/modules/snmp.so
}

package_php-zts-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=('php-zts' 'sqlite')

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/php/modules/pdo_sqlite.so
}

package_php-zts-tidy() {
	pkgdesc='tidy module for PHP'
	depends=('php-zts' 'tidy')

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/php/modules/tidy.so
}

package_php-zts-xsl() {
	pkgdesc='xsl module for PHP'
	depends=('php-zts' 'libxslt')

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/php/modules/xsl.so
}
