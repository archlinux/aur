# $Id$
# Maintainer: Michael Taboada <michael@2mb.solutions>

# this package is heavily based off of the aur php70 package, as well as the php71 package in community.

pkgbase=php71-noconflict
_pkgbase=${pkgbase%71-noconflict}
_realpkg=${pkgbase%-noconflict}
pkgname=("${pkgbase}"
         "${_realpkg}-"{cgi,apache,fpm,embed,phpdbg,dblib,enchant,gd,imap,intl,mcrypt,odbc,pgsql,pspell,snmp,sqlite,tidy,xsl}"-noconflict")
pkgver=7.1.25
pkgrel=1
pkgdesc="php 7.1 compiled as to not conflict with php 7.2+"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'freetds' 'pcre')
#checkdepends=('procps-ng')
# keys:
# pub   4096R/7BD5DCD0 2016-05-07
#       Key fingerprint = A917 B1EC DA84 AEC2 B568 FED6 F50A BC80 7BD5 DCD0
# uid                  Davey Shafik <davey@php.net>
#
# pub   2048R/31CBD89E 2016-12-08
#       Key fingerprint = 5289 95BF EDFB A719 1D46  839E F9BA 0ADA 31CB D89E
# uid                  Joe Watkins <krakjoe@php.net>
#
# pub   4096R/70D12172 2017-04-14 [expires: 2024-04-21]
#       Key fingerprint = 1729 F839 38DA 44E2 7BA0  F4D3 DBDB 3974 70D1 2172
# uid                  Sara Golemon <pollita@php.net>
validpgpkeys=(
        'A917B1ECDA84AEC2B568FED6F50ABC807BD5DCD0'
        '528995BFEDFBA7191D46839EF9BA0ADA31CBD89E'
        '1729F83938DA44E27BA0F4D3DBDB397470D12172'
)
source=("https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch' 'enchant-2.patch' 'php-freetype-2.9.1.patch')
sha256sums=('0fd8dad1903cd0b2d615a1fe4209f99e53b7292403c8ffa1919c0f4dd1eada88'
            'SKIP'
            '258b33b6531b1128d9804c8b608b6013423a421edcf764747042d07e79ec6df3'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            '06f3fa51052d5cf21369e1f6ee0b13365a93bfa05ff672d02f30e8ea4974d815'
            '3f4625d50cf50ce828c6c23f20e1292a0e009fe2c8922368cddda9d44dbc1cc8'
            '46a35d04bdef718f4974e732331bbd9988d77de3f4a6f5867a184dd175dfaf3b'
            'b11c3de747ef222696f5135556d624e3f7f0135a3cb1b06082f1ec8e9b7eeb0a'
            'f9fe57f809ac13e0043d18b795ef777af3e8c710a83745b37b09db536f683d2a')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/apache.patch
	patch -p0 -i ${srcdir}/php-fpm.patch
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p1 -i ${srcdir}/enchant-2.patch
        patch -p1 -i ${srcdir}/php-freetype-2.9.1.patch
}

build() {
	local _phpconfig="--srcdir=../${_pkgbase}-${pkgver} \
		--config-cache \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/${_realpkg} \
		--localstatedir=/var \
                --libdir=/usr/lib/${_realpkg} \
                --datarootdir=/usr/share/${_realpkg} \
                --datadir=/usr/share/${_realpkg} \
                --program-suffix=${_realpkg#php} \
		--with-layout=GNU \
		--with-config-file-path=/etc/${_realpkg} \
		--with-config-file-scan-dir=/etc/${_realpkg}/conf.d \
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
		--enable-pcntl \
		"

	EXTENSION_DIR=/usr/lib/${_realpkg}/modules
	export EXTENSION_DIR
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

#check() {
#	cd ${srcdir}/${_pkgbase}-${pkgver}
#
#	# Check if sendmail was configured correctly (FS#47600)
#	${srcdir}/build/sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'
#
#	export REPORT_EXIT_STATUS=1
#	export NO_INTERACTION=1
#	export SKIP_ONLINE_TESTS=1
#	export SKIP_SLOW_TESTS=1
#
#	${srcdir}/build/sapi/cli/php -n run-tests.php -n -P {tests,Zend}
#}

package_php71-noconflict() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development'
	depends=('libxml2' 'curl' 'libzip' 'pcre')
	backup=("etc/${_realpkg}/php.ini")
	provides=("${_pkgbase}=${pkgver}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${_realpkg}/php.ini
	install -d -m755 ${pkgdir}/etc/${_realpkg}/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/${_realpkg}/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/${_realpkg}/modules/{enchant,gd,imap,intl,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include

# move include directory
        mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${_realpkg}

# fix phar symlink
        rm ${pkgdir}/usr/bin/phar
        ln -sf phar.${_realpkg/php/phar} ${pkgdir}/usr/bin/${_realpkg/php/phar}

        # rename executables
        mv ${pkgdir}/usr/bin/phar.{phar,${_realpkg/php/phar}}

        # rename man pages
        mv ${pkgdir}/usr/share/man/man1/{phar,${_realpkg/php/phar}}.1
        mv ${pkgdir}/usr/share/man/man1/phar.{phar,${_realpkg/php/phar}}.1

        # fix paths in executables
        sed -i "/^includedir=/c \includedir=/usr/include/${_realpkg}" ${pkgdir}/usr/bin/${_realpkg/php/phpize}
        sed -i "/^include_dir=/c \include_dir=/usr/include/${_realpkg}" ${pkgdir}/usr/bin/${_realpkg/php/php-config}

        # make phpize use php-config71
        sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${_realpkg/php/php-config}]], ${_realpkg/php/php-config}, no)" ${pkgdir}/usr/lib/${_realpkg}/build/phpize.m4
}

package_php71-cgi-noconflict() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-cgi=${pkgver}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php71-apache-noconflict() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache')
	backup=("etc/httpd/conf/extra/${_realpkg}_module.conf")
	provides=("${_pkgbase}-apache=${pkgver}")
        echo "# End of LoadModule in httpd.conf - see ArchWiki Apache HTTP Server"
        echo "LoadModule php7_module modules/libphp71.so"
        echo "AddHandler php7-script .php"
        echo "# End of Include List"
        echo "Include conf/extra/php71_module.conf"
	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/lib${_realpkg}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${_realpkg}_module.conf
}

package_php71-fpm-noconflict() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${pkgbase}" 'systemd')
	backup=("etc/${_realpkg}/php-fpm.conf" "etc/${_realpkg}/php-fpm.d/www.conf")
	options=('!emptydirs')
	provides=("${_pkgbase}-fpm=${pkgver}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${_realpkg}-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_realpkg}-fpm.conf
}

package_php71-embed-noconflict() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}" 'libsystemd')
	options=('!emptydirs')
	provides=("${_pkgbase}-embed=${pkgver}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
# move libphp7.so to libphp-71.so -- note well: this is to prevent ldconfig
# from complaining about libphp7.so not being a symbolic link if another php7 is installed.
mv ${pkgdir}/usr/lib/libphp7.so ${pkgdir}/usr/lib/libphp-71.so
}

package_php71-phpdbg-noconflict() {
	pkgdesc='Interactive PHP debugger'
	depends=("${pkgbase}")
	options=('!emptydirs')
	provides=("${_pkgbase}-phpdbg=${pkgver}")

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php71-dblib-noconflict() {
	pkgdesc='dblib module for PHP'
	depends=("${pkgbase}" 'freetds')
	provides=("${_pkgbase}-dblib=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_dblib.so
}

package_php71-enchant-noconflict() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')
	provides=("${_pkgbase}-enchant=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/${_realpkg}/modules/enchant.so
}

package_php71-gd-noconflict() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')
	provides=("${_pkgbase}-gd=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/${_realpkg}/modules/gd.so
}

package_php71-imap-noconflict() {
	pkgdesc='imap module for PHP'
	depends=("${pkgbase}" 'c-client')
	provides=("${_pkgbase}-imap=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/${_realpkg}/modules/imap.so
}

package_php71-intl-noconflict() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')
	provides=("${_pkgbase}-intl=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/${_realpkg}/modules/intl.so
}

package_php71-mcrypt-noconflict() {
	pkgdesc='mcrypt module for PHP'
	depends=("${pkgbase}" 'libmcrypt' 'libtool')
	provides=("${_pkgbase}-mcrypt=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/mcrypt.so ${pkgdir}/usr/lib/${_realpkg}/modules/mcrypt.so
}

package_php71-odbc-noconflict() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')
	provides=("${_pkgbase}-odbc=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/${_realpkg}/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_odbc.so
}

package_php71-pgsql-noconflict() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')
	provides=("${_pkgbase}-pgsql=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/${_realpkg}/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_pgsql.so
}

package_php71-pspell-noconflict() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')
	provides=("${_pkgbase}-pspell=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/${_realpkg}/modules/pspell.so
}

package_php71-snmp-noconflict() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')
	provides=("${_pkgbase}-snmp=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/${_realpkg}/modules/snmp.so
}

package_php71-sqlite-noconflict() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')
	provides=("${_pkgbase}-sqlite=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/${_realpkg}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_sqlite.so
}

package_php71-tidy-noconflict() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidy')
	provides=("${_pkgbase}-tidy=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/${_realpkg}/modules/tidy.so
}

package_php71-xsl-noconflict() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')
	provides=("${_pkgbase}-xsl=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/${_realpkg}/modules/xsl.so
}
