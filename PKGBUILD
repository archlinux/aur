# Maintainer: Timo Sarawinski <timo@it-kraut.net>

pkgbase=php80-zts
pkgdesc='php 8.0 with zts'
__pkgbase=php80
_pkgbase=${pkgbase%80-zts}
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
pkgver=8.0.1
pkgrel=1
arch=('x86_64')
license=('PHP')
url='https://www.php.net/'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libsodium' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre2' 'libnsl'
             'oniguruma' 'libwebp' 'libxpm' 'openjpeg2' 'libjpeg-turbo' 'freetype2' 'libiodbc' 'libxcrypt' 'aspell-de' 'aspell' 'clang' 'llvm')
checkdepends=('procps-ng')
source=("https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch'
        'enchant-2.patch' )
sha256sums=('208b3330af881b44a6a8c6858d569c72db78dab97810332978cc65206b0ec2dc'
            'SKIP'
            'b4ea038f2863801175d6c4e74c685913feecdd5be3d49aff7d9b3fa92d8c4159'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            '591a266b62cd027483675b07254a61f54fe73d2118b4fbea7b168b632cb7243d'
            '3d8c5d47300ddd9509dcc502209a4337f46ff1b424764498c18e1e34e8240dea'
            '7a0b7b976d61d4f0e0c12572e781021e03a364eae89aa1e5d76846049d6dba2f'
            '3992491eebaf5b31f6b00095a7276d11682f9a8aaff473bfb25afbdcfa6eba32')
validpgpkeys=('CBAF69F173A0FEA4B537F470D66C9593118BCCB6'
              '9B67A5C12229118F'
              'BFDDD28642824F8118EF77909B67A5C12229118F'
              '1729F83938DA44E27BA0F4D3DBDB397470D12172'
              'F38252826ACD957EF380D39F2F7956BC5DA04B5D')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

	patch -p0 -i ${srcdir}/apache.patch
	patch -p0 -i ${srcdir}/php-fpm.patch
	patch -p0 -i ${srcdir}/php.ini.patch
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
		--sysconfdir=/etc/${__pkgbase} \
		--localstatedir=/var \
		--libdir=/usr/lib/${__pkgbase} \
		--datarootdir=/usr/share/${__pkgbase} \
		--datadir=/usr/share/${__pkgbase} \
		--program-suffix=${__pkgbase#php} \
		--with-layout=GNU \
		--with-config-file-path=/etc/${__pkgbase} \
		--with-config-file-scan-dir=/etc/${__pkgbase}/conf.d \
		--disable-rpath \
		--mandir=/usr/share/man \
		--without-pear \
                --enable-zts \
		"

	local _phpextensions="\
		--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd=shared \
		--enable-intl=shared \
		--enable-mbstring \
		--enable-pcntl \
		--enable-shmop=shared \
		--enable-soap=shared \
		--enable-sockets=shared \
		--enable-sysvmsg=shared \
		--enable-sysvsem=shared \
		--enable-sysvshm=shared \
		--with-bz2=shared \
		--with-curl=shared \
		--with-db4=/usr \
		--with-enchant=shared \
		--with-external-gd \
		--with-external-pcre \
		--with-ffi=shared \
		--with-gdbm \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-imap-ssl \
		--with-imap=shared \
		--with-kerberos \
		--with-ldap=shared \
		--with-ldap-sasl \
		--with-mhash \
		--with-mysql-sock=/run/mysqld/mysqld.sock \
		--with-mysqli=shared,mysqlnd \
		--with-openssl \
		--with-password-argon2 \
		--with-pdo-dblib=shared,/usr \
		--with-pdo-mysql=shared,mysqlnd \
		--with-pdo-odbc=shared,unixODBC,/usr \
		--with-pdo-pgsql=shared \
		--with-pdo-sqlite=shared \
		--with-pgsql=shared \
		--with-pspell=shared \
		--with-readline \
		--with-snmp=shared \
		--with-sodium=shared \
		--with-sqlite3=shared \
		--with-tidy=shared \
		--with-unixODBC=shared \
		--with-xsl=shared \
		--with-zlib \
		--with-zip=shared \
		"

	EXTENSION_DIR=/usr/lib/${__pkgbase}/modules
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
	cd ${srcdir}/build

	# Check if sendmail was configured correctly (FS#47600)
	sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1
	export TEST_PHP_ARGS="-j$(nproc)"
	export TESTS='tests Zend'

        make test
}

package_php80-zts() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development'
	depends=('libxml2' 'curl' 'hspell' 'nuspell' 'libzip' 'pcre2' 'argon2')
	replaces=('php80-ldap')
	conflicts=('php80-ldap')
	provides=("php80-ldap=${pkgver}" "php80")
	backup=("etc/${__pkgbase}/php.ini")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${__pkgbase}/php.ini
	install -d -m755 ${pkgdir}/etc/${__pkgbase}/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/${__pkgbase}/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/${__pkgbase}/modules/{enchant,gd,imap,intl,sodium,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include

	# move include directory
	mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${__pkgbase}

	# fix phar symlink
	#rm ${pkgdir}/usr/bin/phar
	ln -sf phar.phar80 ${pkgdir}/usr/bin/phar80

	# rename executables
	#mv ${pkgdir}/usr/bin/phar.phar ${pkgdir}/usr/bin/phar.phar80

	# rename man pages
	#mv ${pkgdir}/usr/share/man/man1/{phar,phar80}.1
	#mv ${pkgdir}/usr/share/man/man1/phar.{phar,phar80}.1

	# fix paths in executables
	sed -i "/^includedir=/c \includedir=/usr/include/${__pkgbase}" ${pkgdir}/usr/bin/phpize80
	sed -i "/^include_dir=/c \include_dir=/usr/include/${__pkgbase}" ${pkgdir}/usr/bin/php-config80

	# make phpize use php-config80
	sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [php-config80]], php-config80, no)" ${pkgdir}/usr/lib/${__pkgbase}/build/phpize.m4
}

package_php80-zts-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${__pkgbase}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php80-zts-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${__pkgbase}" 'apache' 'libnsl')
	backup=("etc/httpd/conf/extra/${__pkgbase}_module.conf")

	install -D -m755 ${srcdir}/build-apache/libs/libphp.so ${pkgdir}/usr/lib/httpd/modules/lib${__pkgbase}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${__pkgbase}_module.conf
}

package_php80-zts-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${__pkgbase}" 'systemd')
	backup=("etc/${__pkgbase}/php-fpm.conf" "etc/${__pkgbase}/php-fpm.d/www.conf")
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${__pkgbase}-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${__pkgbase}-fpm.conf
}

package_php80-zts-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${__pkgbase}" 'systemd-libs' 'libnsl')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
	mv ${pkgdir}/usr/lib/libphp.so ${pkgdir}/usr/lib/libphp-80.so
}

package_php80-zts-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=("${__pkgbase}")
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php80-zts-dblib() {
	pkgdesc='dblib module for PHP'
	depends=("${__pkgbase}" 'freetds')

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${__pkgbase}/modules/pdo_dblib.so
}

package_php80-zts-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("${__pkgbase}" 'enchant')

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/${__pkgbase}/modules/enchant.so
}

package_php80-zts-gd() {
	pkgdesc='gd module for PHP'
	depends=("${__pkgbase}" 'gd')

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/${__pkgbase}/modules/gd.so
}

package_php80-zts-imap() {
	pkgdesc='imap module for PHP'
	depends=("${__pkgbase}" 'c-client')

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/${__pkgbase}/modules/imap.so
}

package_php80-zts-intl() {
	pkgdesc='intl module for PHP'
	depends=("${__pkgbase}" 'icu')

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/${__pkgbase}/modules/intl.so
}

package_php80-zts-sodium() {
	pkgdesc='sodium module for PHP'
	depends=("${__pkgbase}" 'libsodium')

	install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/usr/lib/${__pkgbase}/modules/sodium.so
}

package_php80-zts-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("${__pkgbase}" 'unixodbc')

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/${__pkgbase}/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${__pkgbase}/modules/pdo_odbc.so
}

package_php80-zts-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${__pkgbase}" 'postgresql-libs')

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/${__pkgbase}/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${__pkgbase}/modules/pdo_pgsql.so
}

package_php80-zts-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("${__pkgbase}" 'aspell')

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/${__pkgbase}/modules/pspell.so
}

package_php80-zts-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("${__pkgbase}" 'net-snmp')

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/${__pkgbase}/modules/snmp.so
}

package_php80-zts-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("${__pkgbase}" 'sqlite')

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/${__pkgbase}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${__pkgbase}/modules/pdo_sqlite.so
}

package_php80-zts-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("${__pkgbase}" 'tidy')

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/${__pkgbase}/modules/tidy.so
}

package_php80-zts-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("${__pkgbase}" 'libxslt')

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/${__pkgbase}/modules/xsl.so
}
