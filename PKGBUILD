# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=php71
_pkgbase=php
pkgname=("$pkgbase"
         "$pkgbase-cgi"
         "$pkgbase-apache"
         "$pkgbase-fpm"
         "$pkgbase-embed"
         "$pkgbase-phpdbg"
         "$pkgbase-dblib"
         "$pkgbase-enchant"
         "$pkgbase-gd"
         "$pkgbase-imap"
         "$pkgbase-intl"
         "$pkgbase-mcrypt"
         "$pkgbase-odbc"
         "$pkgbase-pgsql"
         "$pkgbase-pspell"
         "$pkgbase-snmp"
         "$pkgbase-sqlite"
         "$pkgbase-tidy"
         "$pkgbase-xsl")
pkgver=7.1.15
pkgrel=1
arch=('x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre')
checkdepends=('procps-ng')
provides=("${_pkgbase}=${pkgver}")
source=("https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch' 'enchant-2.patch')
sha512sums=('2b23795ffcb9d741adafe8a1e01e6988bb86ce7c6380bdbe822f8f6485e217ed2e95a27daf5ba11f0bf10317f1e1f4e37068e40d0bf322de5625d38b430d37c2'
            '65ea5cb38c1fc1874b2a4d08bc52443f9ed5dcc92cf99023a74292c78f9074516296f56c768f7efa8a1f0838feac47b356d3da6fdb1199419bebec3a93204ae6'
            'fc3d711033c8b7ead910826d7c0d4479b481fa9d84c3147b1d33ef9b1e3d3d073a8d17a7c7f66db30d710be1c9b17d2b5536a74a4f05c4ff88b9339e95dd244a'
            'ef2724cedec46a6955355fc75406efa2895545f2ebcdfcee06ce6f3c9a20f8348a291ac78ab1e384b703095d317f59504b787f21074f841c45e53a98955af0c1'
            '209a8b2f9e2e25887c86e126c2761aae329e2bf9456a5de735f3ae264bd2be21e7646cc1954c1417e4c74f8d2d6b0f6081aa74a5af48f6b97484bab0d4e72fcf'
            '978ad84ffe8a0d10a62725173f3a56fd05f8d8347066760017f3555d009de8b9772f31c37f97ec87cfad22f60522d3c4a27a2deda4b95195c1cd459b704f6f58'
            '89993be67988f6db09e1102214a41fdb7223274bc6ca71f1defc5fe9548d832485f7133b8ba82860f04da00c7f655d701c7550460c0172a2a2d31ef3f3f96038')

_optdir=/opt/$pkgbase

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/apache.patch
	patch -p0 -i ${srcdir}/php-fpm.patch
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p1 -i ../enchant-2.patch
}

build() {
	local _phpconfig="--srcdir=../${_pkgbase}-${pkgver} \
		--config-cache \
		--prefix=${_optdir}/usr \
		--sbindir=${_optdir}/usr/bin \
		--sysconfdir=${_optdir}/etc/php \
		--localstatedir=${_optdir}/var \
		--with-layout=GNU \
		--with-config-file-path=${_optdir}/etc/php \
		--with-config-file-scan-dir=${_optdir}/etc/php/conf.d \
		--disable-rpath \
		--mandir=${_optdir}/usr/share/man \
		--without-pear \
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
		--with-mhash \
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysqli=shared,mysqlnd \
		--with-openssl \
		--with-password-argon2 \
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
		--with-mcrypt=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		--enable-pcntl \
		"

	EXTENSION_DIR=${_optdir}/usr/lib/php/modules
	export EXTENSION_DIR

  [[ -d ${srcdir}/build ]] && rm -r ${srcdir}/build

	mkdir ${srcdir}/build
	cd ${srcdir}/build
	ln -s ../${_pkgbase}-${pkgver}/configure
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
	cd ${srcdir}/${_pkgbase}-${pkgver}

	# Check if sendmail was configured correctly (FS#47600)
	${srcdir}/build/sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1

	${srcdir}/build/sapi/cli/php -n run-tests.php -n -P {tests,Zend}
}

package_php71() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development'
	depends=('libxml2' 'curl' 'libzip' 'pcre' 'argon2')
	backup=("${_optdir#/}etc/php/php.ini")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}${_optdir}/etc/php/php.ini
	install -d -m755 ${pkgdir}${_optdir}/etc/php/conf.d/

	# remove static modules
	rm -f ${pkgdir}${_optdir}/usr/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}${_optdir}/usr/lib/php/modules/{enchant,gd,imap,intl,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}${_optdir}/usr/include/php/include
}

package_php71-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("$pkgbase")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php71-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("$pkgbase" 'apache')
	backup=("${_optdir#/}etc/httpd/conf/extra/php7_module.conf")

	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/${pkgbase}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${pkgbase}_module.conf
}

package_php71-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("$pkgbase" 'systemd')
	backup=("${_optdir#/}etc/php/php-fpm.conf" "${_optdir#/}etc/php/php-fpm.d/www.conf")
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/php71-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/php71-fpm.conf
}

package_php71-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("$pkgbase" 'libsystemd')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
}

package_php71-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=("$pkgbase")
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php71-dblib() {
	pkgdesc='dblib module for PHP'
	depends=("$pkgbase" 'freetds')

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}${_optdir}/usr/lib/php/modules/pdo_dblib.so
}

package_php71-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("$pkgbase" 'enchant')

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}${_optdir}/usr/lib/php/modules/enchant.so
}

package_php71-gd() {
	pkgdesc='gd module for PHP'
	depends=("$pkgbase" 'gd')

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}${_optdir}/usr/lib/php/modules/gd.so
}

package_php71-imap() {
	pkgdesc='imap module for PHP'
	depends=("$pkgbase" 'c-client')

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}${_optdir}/usr/lib/php/modules/imap.so
}

package_php71-intl() {
	pkgdesc='intl module for PHP'
	depends=("$pkgbase" 'icu')

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}${_optdir}/usr/lib/php/modules/intl.so
}

package_php71-mcrypt() {
	pkgdesc='mcrypt module for PHP'
	depends=("$pkgbase" 'libmcrypt' 'libtool')

	install -D -m755 ${srcdir}/build/modules/mcrypt.so ${pkgdir}${_optdir}/usr/lib/php/modules/mcrypt.so
}

package_php71-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("$pkgbase" 'unixodbc')

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}${_optdir}/usr/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}${_optdir}/usr/lib/php/modules/pdo_odbc.so
}

package_php71-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("$pkgbase" 'postgresql-libs')

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}${_optdir}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}${_optdir}/usr/lib/php/modules/pdo_pgsql.so
}

package_php71-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("$pkgbase" 'aspell')

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}${_optdir}/usr/lib/php/modules/pspell.so
}

package_php71-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("$pkgbase" 'net-snmp')

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}${_optdir}/usr/lib/php/modules/snmp.so
}

package_php71-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("$pkgbase" 'sqlite')

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}${_optdir}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}${_optdir}/usr/lib/php/modules/pdo_sqlite.so
}

package_php71-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("$pkgbase" 'tidy')

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}${_optdir}/usr/lib/php/modules/tidy.so
}

package_php71-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("$pkgbase" 'libxslt')

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}${_optdir}/usr/lib/php/modules/xsl.so
}
