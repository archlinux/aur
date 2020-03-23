# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=php73
_pkgbase=${pkgbase%73}
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
         "${pkgbase}-sodium"
         "${pkgbase}-odbc"
         "${pkgbase}-pgsql"
         "${pkgbase}-pspell"
         "${pkgbase}-snmp"
         "${pkgbase}-sqlite"
         "${pkgbase}-tidy"
         "${pkgbase}-xsl")
pkgver=7.3.16
pkgrel=1
arch=('x86_64')
license=('PHP')
url='https://www.php.net/'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libsodium' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre2' 'libnsl')
checkdepends=('procps-ng')
source=("https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch'
        'enchant-2.patch' 'freetype.patch')
sha256sums=('91aaee3dbdc71b69b4f3292f9d99211172a2fa926c3f3bbdb0e85dab03dd2bcb'
            'SKIP'
            '62e5ceea3c90a3c6eab1166488f876e766efcfd7d4e973c44060a9e72d51a98a'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            '7e4736dc63746e8b58f0d76ccbcd14cf5f221864b61ba16e2fc736e1ac22f41a'
            'c28997b08d3ea257a2435164e35d0340f42cd3306def6a94b6b8c0a2f5644def'
            'cd3b12c1cd5860f77325ef5405b987eca9cd894cbc99bde6ea4bdbed78ff5d46'
            '3992491eebaf5b31f6b00095a7276d11682f9a8aaff473bfb25afbdcfa6eba32'
            '07c4648669dc05afc3c1ad5a4739768079c423b817eabf5296ca3d1ea5ffd163')
validpgpkeys=('CBAF69F173A0FEA4B537F470D66C9593118BCCB6'
              'F38252826ACD957EF380D39F2F7956BC5DA04B5D')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/apache.patch
	patch -p0 -i ${srcdir}/php-fpm.patch
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p1 -i ${srcdir}/enchant-2.patch
	patch -p1 -i ${srcdir}/freetype.patch
	autoconf

	rm tests/output/stream_isatty_*.phpt
}

build() {
	# http://site.icu-project.org/download/61#TOC-Migration-Issues
	CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

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
		--mandir=/usr/share/man \
		--without-pear \
		"

	local _phpextensions="\
		--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
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
		--with-sodium=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		--enable-pcntl \
		"

	EXTENSION_DIR=/usr/lib/${pkgbase}/modules
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

package_php73() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development'
	depends=('libxml2' 'curl' 'libzip' 'pcre2' 'argon2')
	replaces=('php73-ldap')
	conflicts=('php73-ldap')
	provides=("php73-ldap=${pkgver}")
	backup=("etc/${pkgbase}/php.ini")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${pkgbase}/php.ini
	install -d -m755 ${pkgdir}/etc/${pkgbase}/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/{enchant,gd,imap,intl,sodium,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include

	# move include directory
	mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${pkgbase}

	# fix phar symlink
	rm ${pkgdir}/usr/bin/phar
	ln -sf phar.phar73 ${pkgdir}/usr/bin/phar73

	# rename executables
	mv ${pkgdir}/usr/bin/phar.phar ${pkgdir}/usr/bin/phar.phar73

	# rename man pages
	mv ${pkgdir}/usr/share/man/man1/{phar,phar73}.1
	mv ${pkgdir}/usr/share/man/man1/phar.{phar,phar73}.1

	# fix paths in executables
	sed -i "/^includedir=/c \includedir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/phpize73
	sed -i "/^include_dir=/c \include_dir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/php-config73

	# make phpize use php-config73
	sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [php-config73]], php-config73, no)" ${pkgdir}/usr/lib/${pkgbase}/build/phpize.m4
}

package_php73-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php73-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache' 'libnsl')
	backup=("etc/httpd/conf/extra/${pkgbase}_module.conf")

	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${pkgbase}_module.conf
}

package_php73-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${pkgbase}" 'systemd')
	backup=("etc/${pkgbase}/php-fpm.conf" "etc/${pkgbase}/php-fpm.d/www.conf")
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${pkgbase}-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}-fpm.conf
}

package_php73-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}" 'systemd-libs' 'libnsl')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
	mv ${pkgdir}/usr/lib/libphp7.so ${pkgdir}/usr/lib/libphp-73.so
}

package_php73-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=("${pkgbase}")
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php73-dblib() {
	pkgdesc='dblib module for PHP'
	depends=("${pkgbase}" 'freetds')

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_dblib.so
}

package_php73-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/${pkgbase}/modules/enchant.so
}

package_php73-gd() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/${pkgbase}/modules/gd.so
}

package_php73-imap() {
	pkgdesc='imap module for PHP'
	depends=("${pkgbase}" 'c-client')

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/${pkgbase}/modules/imap.so
}

package_php73-intl() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/${pkgbase}/modules/intl.so
}

package_php73-sodium() {
	pkgdesc='sodium module for PHP'
	depends=("${pkgbase}" 'libsodium')

	install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/usr/lib/${pkgbase}/modules/sodium.so
}

package_php73-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_odbc.so
}

package_php73-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_pgsql.so
}

package_php73-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/${pkgbase}/modules/pspell.so
}

package_php73-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/${pkgbase}/modules/snmp.so
}

package_php73-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/${pkgbase}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_sqlite.so
}

package_php73-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidy')

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/${pkgbase}/modules/tidy.so
}

package_php73-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/${pkgbase}/modules/xsl.so
}
