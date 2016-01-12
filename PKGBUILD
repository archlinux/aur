# Maintainer: mickael9 <mickael9 at gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Thore Bödecker <me@foxxx0.de>
#
# Changes from 2016-01-10, by Thore Bödecker:
# 	reworked everything to allow php56 to co-exist with upstream php packages


pkgbase=php56
_pkgbase=${pkgbase%56}
_buildprefix="/opt/${pkgbase}"
pkgname=("${pkgbase}"
         "${pkgbase}-cgi"
         "${pkgbase}-apache"
         "${pkgbase}-fpm"
         "${pkgbase}-embed"
         "${pkgbase}-phpdbg"
         "${pkgbase}-pear"
         "${pkgbase}-enchant"
         "${pkgbase}-gd"
         "${pkgbase}-imap"
         "${pkgbase}-intl"
         "${pkgbase}-ldap"
         "${pkgbase}-mcrypt"
         "${pkgbase}-mssql"
         "${pkgbase}-odbc"
         "${pkgbase}-pgsql"
         "${pkgbase}-pspell"
         "${pkgbase}-snmp"
         "${pkgbase}-sqlite"
         "${pkgbase}-tidy"
         "${pkgbase}-xsl")
pkgver=5.6.17
pkgrel=2
pkgdesc="A general-purpose scripting language that is especially suited to web development"
arch=('i686' 'x86_64')
license=('PHP')
url='http://php.net'
makedepends=('apache' 'c-client' 'postgresql-libs' 'libldap' 'msmtp-mta'
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'gd' 'icu'
             'curl' 'libxslt' 'openssl' 'db' 'gmp' 'systemd')

source=("http://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        "http://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz.asc"
        'php.ini.patch' 'apache.conf' 'php-fpm.conf.in.patch'
        'logrotate.d.php-fpm' 'php-fpm.service' 'php-fpm.tmpfiles')
md5sums=('5e080e4b7df5db24f1b64313f8114bd8'
         'SKIP'
         'f66d04cc5a54241747ae2ca5f15e1bad'
         'dec2cbaad64e3abf4f0ec70e1de4e8e9'
         '2d0e98c423a9dc57e923f31d63117106'
         '25bc67ad828e8147a817410b68d8016c'
         'c1cc15d2123931f883f75f231ae44f60'
         '12392414f768281ae96f292d0aa9669c')
validpgpkeys=('6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3'
              '0BD78B5F97500D450838F95DFE857D9A90D90EC1')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p0 -i ${srcdir}/php-fpm.conf.in.patch
	# Just because our Apache 2.4 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
	# Let's supress this behaviour and build a SAPI that works fine with the prefork MPM.
	sed '/APACHE_THREADED_MPM=/d' -i sapi/apache2handler/config.m4 -i configure
}

build() {
	local _phpconfig="--srcdir=../${_pkgbase}-${pkgver} \
		--config-cache \
		--prefix=${_buildprefix} \
		--sbindir=${_buildprefix}/bin \
		--sysconfdir=${_buildprefix}/etc/php \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=${_buildprefix}/etc/php \
		--with-config-file-scan-dir=${_buildprefix}/etc/php/conf.d \
		--disable-rpath \
		--mandir=${_buildprefix}/share/man \
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
		--with-kerberos=/usr \
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
		"

	EXTENSION_DIR=${_buildprefix}/lib/php/modules
	export EXTENSION_DIR
	PEAR_INSTALLDIR=${_buildprefix}/share/pear
	export PEAR_INSTALLDIR

	cd ${srcdir}/${_pkgbase}-${pkgver}

	# php
	mkdir ${srcdir}/build-php
	cd ${srcdir}/build-php
	ln -s ../${_pkgbase}-${pkgver}/configure
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

	# pear
	cp -a ${srcdir}/build-php ${srcdir}/build-pear
	cd ${srcdir}/build-pear
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear \
		${_phpextensions}
	make
}

#check() {
#	cd ${srcdir}/${_pkgbase}-${pkgver}
#
#	# tests on i686 fail
#	[[ $CARCH == 'i686' ]] && return
#	# a couple of tests fail in btrfs-backed chroots
#	[[ $(stat -f -c %T .) == btrfs ]] && return
#
#	export REPORT_EXIT_STATUS=1
#	export NO_INTERACTION=1
#	export SKIP_ONLINE_TESTS=1
#	export SKIP_SLOW_TESTS=1
#
#	${srcdir}/build-php/sapi/cli/php -n \
#		run-tests.php -n -P \
#		{tests,Zend,ext/{spl,standard},sapi/cli}
#}

package_php56() {
	pkgdesc='An HTML-embedded scripting language'
	depends=('pcre' 'libxml2' 'curl' 'libzip')
	backup=("${_buildprefix#/}/etc/php/php.ini")
	provides=("${_pkgbase}=$pkgver")

	cd ${srcdir}/build-php
	make -j1 INSTALL_ROOT=${pkgdir} install

	install -d -m755 ${pkgdir}/${_buildprefix#/}/share/pear
	# install php.ini
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/${_buildprefix#/}/etc/php/php.ini
	install -d -m755 ${pkgdir}/${_buildprefix#/}/etc/php/conf.d/

	# remove static modules
	rm -f ${pkgdir}/${_buildprefix#/}/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/${_buildprefix#/}/lib/php/modules/{enchant,gd,imap,intl,ldap,mcrypt,mssql,odbc,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/${_buildprefix#/}/include/php/include

	# set symlinks
	mkdir -p ${pkgdir}/etc;
	ln -sf ${_buildprefix}/etc/php ${pkgdir}/etc/${pkgbase}

	mkdir -p ${pkgdir}/usr/bin;
	ln -sf ${_buildprefix}/bin/phar.phar ${pkgdir}/usr/bin/phar56
	ln -sf ${_buildprefix}/bin/php ${pkgdir}/usr/bin/${pkgbase}
	ln -sf ${_buildprefix}/bin/php-config ${pkgdir}/usr/bin/${pkgbase}-config
	ln -sf ${_buildprefix}/bin/phpize ${pkgdir}/usr/bin/${pkgbase}ize

	mkdir -p ${pkgdir}/usr/share/man/man1;
	ln -sf ${_buildprefix}/share/man/man1/phar.1 ${pkgdir}/usr/share/man/man1/phar56.1
	ln -sf ${_buildprefix}/share/man/man1/php-config.1 ${pkgdir}/usr/share/man/man1/${pkgbase}-config.1
	ln -sf ${_buildprefix}/share/man/man1/php.1 ${pkgdir}/usr/share/man/man1/${pkgbase}.1
	ln -sf ${_buildprefix}/share/man/man1/phar.phar.1 ${pkgdir}/usr/share/man/man1/phar56.phar.1
	ln -sf ${_buildprefix}/share/man/man1/phpize.1 ${pkgdir}/usr/share/man/man1/${pkgbase}ize.1
}

package_php56-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-cgi=$pkgver")

	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/${_buildprefix#/}/bin/php-cgi

	mkdir -p ${pkgdir}/usr/bin;
	ln -sf ${_buildprefix}/bin/php-cgi ${pkgdir}/usr/bin/${pkgbase}-cgi
}

package_php56-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache')
	provides=("${_pkgbase}-apache=$pkgver")
	backup=("etc/httpd/conf/extra/${pkgbase}_module.conf")

	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${pkgbase}_module.conf
}

package_php56-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${pkgbase}" 'systemd')
	provides=("${_pkgbase}-fpm=$pkgver")
	backup=("${_buildprefix#/}/etc/php/php-fpm.conf")
	install='php-fpm.install'

	install -d -m755 ${pkgdir}/${_buildprefix#/}/bin
	install -d -m755 ${pkgdir}/${_buildprefix#/}/etc
	install -d -m755 ${pkgdir}/${_buildprefix#/}/etc/logrotate.d

	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/${_buildprefix#/}/bin/php-fpm
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.8 ${pkgdir}/usr/share/man/man8/${pkgbase}-fpm.8
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/${_buildprefix#/}/etc/php/php-fpm.conf
	install -d -m755 ${pkgdir}/${_buildprefix#/}/etc/php/fpm.d
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}-fpm.conf
	install -D -m644 ${srcdir}/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${pkgbase}-fpm.service

	mkdir -p ${pkgdir}/etc/logrotate.d
	install -D -m644 ${srcdir}/logrotate.d.php-fpm ${pkgdir}/etc/logrotate.d/${pkgbase}-fpm

	mkdir -p ${pkgdir}/usr/bin
	ln -sf ${_buildprefix}/bin/php-fpm ${pkgdir}/usr/bin/${pkgbase}-fpm
}

package_php56-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-embed=$pkgver")

	install -D -m755 ${srcdir}/build-embed/libs/libphp5.so ${pkgdir}/${_buildprefix#/}/lib/libphp5.so
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/sapi/embed/php_embed.h ${pkgdir}/${_buildprefix#/}/include/php/sapi/embed/php_embed.h
}

package_php56-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-phpdbg=$pkgver")

	install -D -m755 ${srcdir}/build-phpdbg/sapi/phpdbg/phpdbg ${pkgdir}/${_buildprefix#/}/bin/phpdbg

	mkdir -p ${pkgdir}/usr/bin;
	ln -sf ${_buildprefix}/bin/phpdbg ${pkgdir}/usr/bin/${pkgbase}dbg
}

package_php56-pear() {
	pkgdesc='PHP Extension and Application Repository'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-pear=$pkgver")
	backup=("${_buildprefix#/}/etc/php/pear.conf")

	cd ${srcdir}/build-pear
	make install-pear INSTALL_ROOT=${pkgdir}
	rm -rf ${pkgdir}/${_buildprefix#/}/share/pear/.{channels,depdb,depdblock,filemap,lock,registry}

	mkdir -p ${pkgdir}/usr/bin;
	ln -sf ${_buildprefix}/bin/pear ${pkgdir}/usr/bin/pear56
	ln -sf ${_buildprefix}/bin/peardev ${pkgdir}/usr/bin/pear56dev
	ln -sf ${_buildprefix}/bin/pecl ${pkgdir}/usr/bin/pecl56
}

package_php56-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')
	provides=("${_pkgbase}-enchant=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/enchant.so
}

package_php56-gd() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')
	provides=("${_pkgbase}-gd=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/gd.so
}

package_php56-imap() {
	pkgdesc='imap module for PHP'
	depends=("${pkgbase}" 'c-client')
	provides=("${_pkgbase}-imap=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/imap.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/imap.so
}

package_php56-intl() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')
	provides=("${_pkgbase}-intl=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/intl.so
}

package_php56-ldap() {
	pkgdesc='ldap module for PHP'
	depends=("${pkgbase}" 'libldap')
	provides=("${pkgbase}-ldap=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/ldap.so
}

package_php56-mcrypt() {
	pkgdesc='mcrypt module for PHP'
	depends=("${pkgbase}" 'libmcrypt' 'libltdl')
	provides=("${_pkgbase}-mcrypt=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/mcrypt.so
}

package_php56-mssql() {
	pkgdesc='mssql module for PHP'
	depends=("${pkgbase}" 'freetds')
	provides=("${_pkgbase}-mssql=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/mssql.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/mssql.so
}

package_php56-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')
	provides=("${_pkgbase}-odbc=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/odbc.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_odbc.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/pdo_odbc.so
}

package_php56-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')
	provides=("${_pkgbase}-pgsql=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/pdo_pgsql.so
}

package_php56-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')
	provides=("${_pkgbase}-pspell=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/pspell.so
}

package_php56-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')
	provides=("${_pkgbase}-snmp=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/snmp.so
}

package_php56-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')
	provides=("${_pkgbase}-sqlite=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/pdo_sqlite.so
}

package_php56-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidyhtml')
	provides=("${_pkgbase}-tidy=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/tidy.so
}

package_php56-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')
	provides=("${_pkgbase}-xsl=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/${_buildprefix#/}/lib/php/modules/xsl.so
}
