# $Id$
# Maintainer: Michael Rynn <michael.rynn@parracan.org>
# Derived very much from arch  php packages for 7.1.1 in extra and php56 in AUR
# This is much the same as php56 package
# Maintainer: mickael9 <mickael9 at gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Thore Bödecker <me@foxxx0.de>
# 
pkgbase=php70
_pkgbase=${pkgbase%70}
pkgname=("${pkgbase}"
         "${pkgbase}-cgi"
         "${pkgbase}-apache"
         "${pkgbase}-fpm"
         "${pkgbase}-embed"
         "${pkgbase}-phpdbg"
         "${pkgbase}-dblib"
         "${pkgbase}-enchant"
         "${pkgbase}-gd"
         "${pkgbase}-imap"
         "${pkgbase}-intl"
         "${pkgbase}-mcrypt"
         "${pkgbase}-odbc"
         "${pkgbase}-pgsql"
         "${pkgbase}-pspell"
         "${pkgbase}-snmp"
         "${pkgbase}-sqlite"
         "${pkgbase}-tidy"
         "${pkgbase}-xsl")
pkgver=7.0.15
pkgrel=1
pkgdesc="PHP scripting language package for stable release of 7.0 series"
arch=('i686' 'x86_64')
license=('PHP')


url='http://www.php.net'
makedepends=('apache' 'aspell' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'freetds' 'pcre')

checkdepends=('procps-ng')
source=("https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch'
        )
sha256sums=('300364d57fc4a6176ff7d52d390ee870ab6e30df121026649f8e7e0b9657fe93'
            'SKIP'
            '819f05d2fd5a75c96e93c863517ca77dbd021a1224dc2d8096f758fb2937df6a'
            'df075b89484eb3a08402788580de16d23123f95541b2e9aed8d928105de9b874'
            '651e3f9ba7ac337cbcf54b759f9367cdfadad1f3055d086750d45b0b20056ba7'
            'b6b7f3ced56b75bf95513a46f43cde41fc28da714f5e0ed181caf2266f2f0c27'
            '2f678d039313ee613d59c8b4bf9f48068085df0fa8ac7ca4cf807e168061a8c9'
            )
validpgpkeys=('1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763'
              '528995BFEDFBA7191D46839EF9BA0ADA31CBD89E')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/apache.patch
	patch -p0 -i ${srcdir}/php-fpm.patch
	patch -p0 -i ${srcdir}/php.ini.patch
}


build() {
	local _phpconfig="--srcdir=../${_pkgbase}-${pkgver} \
		--config-cache \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/${pkgbase} \
		--localstatedir=/var \
		--libdir=/usr/lib/${pkgbase} \
		--datarootdir=/usr/share/${pkgbase} \
		--datadir=/usr/share/${pkgbase} \
		--program-suffix=${pkgbase#php} \
		--with-layout=GNU \
		--with-config-file-path=/etc/${pkgbase} \
		--with-config-file-scan-dir=/etc/${pkgbase}/conf.d \
		--disable-rpath \
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
		--enable-pcntl 
		"

	EXTENSION_DIR=/usr/lib/${pkgbase}/modules
	export EXTENSION_DIR

	local _build="${srcdir}/build"
	mkdir ${_build}
	cd ${_build}
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
	cd ../../
	# apache
	# reuse the previous run; this will save us a lot of time
	cp -a ${_build} ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	./configure ${_phpconfig} \
		--with-apxs2 \
		${_phpextensions}
	make
	cd ../../
	# phpdbg
	cp -a ${_build} ${srcdir}/build-phpdbg
	cd ${srcdir}/build-phpdbg
	./configure ${_phpconfig} \
		--enable-phpdbg \
		${_phpextensions}
	make
	cd ../../
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

package_php70() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development'
	depends=('libxml2' 'curl' 'libzip' 'pcre')
	replaces=('php-ldap')
	conflicts=('php-ldap')
	provides=("${_pkgbase}=$pkgver")
	backup=('etc/${pkgbase}/php.ini')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${pkgbase}/php.ini
	install -d -m755 ${pkgdir}/etc/${pkgbase}/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/{enchant,gd,imap,intl,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include

# move include directory
	mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${pkgbase}

# fix phar symlink
	rm ${pkgdir}/usr/bin/phar
	ln -sf phar.${pkgbase/php/phar} ${pkgdir}/usr/bin/${pkgbase/php/phar}

	# rename executables
	mv ${pkgdir}/usr/bin/phar.{phar,${pkgbase/php/phar}}

	# rename man pages
	mv ${pkgdir}/usr/share/man/man1/{phar,${pkgbase/php/phar}}.1
	mv ${pkgdir}/usr/share/man/man1/phar.{phar,${pkgbase/php/phar}}.1

	# fix paths in executables
	sed -i "/^includedir=/c \includedir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/${pkgbase/php/phpize}
	sed -i "/^include_dir=/c \include_dir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/${pkgbase/php/php-config}

	# make phpize use php-config70
	sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${pkgbase/php/php-config}]], ${pkgbase/php/php-config}, no)" ${pkgdir}/usr/lib/${pkgbase}/build/phpize.m4

}

# It seems apache only allows one version
package_php70-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-cgi=$pkgver")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php70-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache')
	backup=("etc/httpd/conf/extra/${_pkgbase}_module.conf")

	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/libphp7.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php7_module.conf
}

package_php70-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${pkgbase}" 'systemd')
	backup=("etc/${pkgbase}/php-fpm.conf")
    options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${pkgbase}-fpm.service
	install -D -m644 ${srcdir}/../php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}-fpm.conf
}

package_php70-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}")
	provides=("${pkgbase}-embed=$pkgver")
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
}

package_php70-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=("${pkgbase}")
	provides=("${pkgbase}-phpdbg=$pkgver")
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php70-dblib() {
	pkgdesc='dblib module for PHP'
	depends=("${pkgbase}")
	provides=("${pkgbase}-dblib=$pkgver")

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_dblib.so
}

package_php70-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')
	provides=("${pkgbase}-enchant=$pkgver")

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/${pkgbase}/modules/enchant.so
}

package_php70-gd() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')
	provides=("${pkgbase}-gd=$pkgver")

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/${pkgbase}/modules/gd.so
}

package_php70-imap() {
	pkgdesc='imap module for PHP'
	depends=("${pkgbase}" 'c-client')
	provides=("${pkgbase}-imap=$pkgver")

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/${pkgbase}/modules/imap.so
}

package_php70-intl() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')
	provides=("${pkgbase}-intl=$pkgver")

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/${pkgbase}/modules/intl.so
}

package_php70-mcrypt() {
	pkgdesc='mcrypt module for PHP'
	depends=("${pkgbase}" 'libmcrypt' 'libltdl')
	provides=("${pkgbase}-mcrypt=$pkgver")

	install -D -m755 ${srcdir}/build/modules/mcrypt.so ${pkgdir}/usr/lib/${pkgbase}/modules/mcrypt.so
}

package_php70-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')
	provides=("${pkgbase}-odbc=$pkgver")

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_odbc.so
}

package_php70-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')
	provides=("${pkgbase}-pgsql=$pkgver")

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_pgsql.so
}

package_php70-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')
	provides=("${pkgbase}-pspell=$pkgver")

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/${pkgbase}/modules/pspell.so
}

package_php70-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')
	provides=("${pkgbase}-snmp=$pkgver")

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/${pkgbase}/modules/snmp.so
}

package_php70-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')
	provides=("${pkgbase}-sqlite=$pkgver")

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/${pkgbase}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_sqlite.so
}

package_php70-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidyhtml')
	provides=("${pkgbase}-tidy=$pkgver")

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/${pkgbase}/modules/tidy.so
}

package_php70-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')
	provides=("${pkgbase}-xsl=$pkgver")

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/${pkgbase}/modules/xsl.so
}