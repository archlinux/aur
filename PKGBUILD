pkgbase=php81
_pkgbase=${pkgbase%81}
_realpkg=${pkgbase}
pkgname=("${pkgbase}"
         "${_realpkg}-"{cgi,apache,fpm,embed,phpdbg,dblib,enchant,gd,imap,intl,sodium,odbc,pgsql,pspell,snmp,sqlite,tidy,xsl})
pkgver=8.1.0
pkgrel=1
arch=('x86_64')
license=('PHP')
url='https://www.php.net/'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libsodium' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre2' 'libnsl'
             'oniguruma' 'patchutils')
checkdepends=('procps-ng')
source=("https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch')

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
        unset CPPFLAGS
	CPPFLAGS+=' -DU_USING_ICU_NAMESPACE=1'

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
		--mandir=/usr/share/man \
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
#	
#    unset CPPFLAGS
#	cd ${srcdir}/build

	# Check if sendmail was configured correctly (FS#47600)
#	sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

#	export REPORT_EXIT_STATUS=1
#	export NO_INTERACTION=1
#	export SKIP_ONLINE_TESTS=1
#	export SKIP_SLOW_TESTS=1
#	export TEST_PHP_ARGS="-j$(nproc)"
#	export TESTS='tests Zend'
#
#        make test
#}

package_php81() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development'
	depends=('libxml2' 'hspell' 'nuspell' 'libvoikko' 'curl' 'libzip' 'pcre2' 'argon2')
	replaces=('php81-ldap')
	conflicts=('php81-ldap')
	provides=("php81-ldap=${pkgver}" "php81")
    backup=("etc/${_realpkg}/php.ini")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${_realpkg}/php.ini
	install -d -m755 ${pkgdir}/etc/${_realpkg}/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/${_realpkg}/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/${_realpkg}/modules/{enchant,gd,imap,intl,sodium,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include

	# move include directory
	mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${_realpkg}

	# fix phar symlink
	#rm ${pkgdir}/usr/bin/phar
	ln -sf phar.phar81 ${pkgdir}/usr/bin/phar81

	# rename executables
	#mv ${pkgdir}/usr/bin/phar.phar ${pkgdir}/usr/bin/phar.phar81

	# rename man pages
	#mv ${pkgdir}/usr/share/man/man1/{phar,phar81}.1
	#mv ${pkgdir}/usr/share/man/man1/phar.{phar,phar81}.1

	# fix paths in executables
	sed -i "/^includedir=/c \includedir=/usr/include/${_realpkg}" ${pkgdir}/usr/bin/phpize81
	sed -i "/^include_dir=/c \include_dir=/usr/include/${_realpkg}" ${pkgdir}/usr/bin/php-config81

	# make phpize use php-config81
	sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [php-config81]], php-config81, no)" ${pkgdir}/usr/lib/${_realpkg}/build/phpize.m4
}

package_php81-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php81-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache' 'libnsl')
	backup=("etc/httpd/conf/extra/${_realpkg}_module.conf")

	install -D -m755 ${srcdir}/build-apache/libs/libphp.so ${pkgdir}/usr/lib/httpd/modules/lib${_realpkg}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${_realpkg}_module.conf
}

package_php81-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${pkgbase}" 'systemd')
	backup=("etc/${_realpkg}/php-fpm.conf" "etc/${_realpkg}/php-fpm.d/www.conf")
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${_realpkg}-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_realpkg}-fpm.conf
}

package_php81-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}" 'systemd-libs' 'libnsl')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
	mv ${pkgdir}/usr/lib/libphp.so ${pkgdir}/usr/lib/libphp-81.so
}

package_php81-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=("${pkgbase}")
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php81-dblib() {
	pkgdesc='dblib module for PHP'
	depends=("${pkgbase}" 'freetds')

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_dblib.so
}

package_php81-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/${_realpkg}/modules/enchant.so
}

package_php81-gd() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/${_realpkg}/modules/gd.so
}

package_php81-imap() {
	pkgdesc='imap module for PHP'
	depends=("${pkgbase}" 'c-client')

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/${_realpkg}/modules/imap.so
}

package_php81-intl() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/${_realpkg}/modules/intl.so
}

package_php81-sodium() {
	pkgdesc='sodium module for PHP'
	depends=("${pkgbase}" 'libsodium')

	install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/usr/lib/${_realpkg}/modules/sodium.so
}

package_php81-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/${_realpkg}/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_odbc.so
}

package_php81-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/${_realpkg}/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_pgsql.so
}

package_php81-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/${_realpkg}/modules/pspell.so
}

package_php81-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/${_realpkg}/modules/snmp.so
}

package_php81-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/${_realpkg}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_sqlite.so
}

package_php81-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidy')

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/${_realpkg}/modules/tidy.so
}

package_php81-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/${_realpkg}/modules/xsl.so
}
sha256sums=('a1317eff0723a2b3d3122bbfe107a1158570ea2822dc35a5fb360086db0f6bbc'
            '702b163c66c65af92dcad8d79f41bda84bcd5d863235fcf1497c33a86db9e4ca'
            'ebc0af1ef3a6baccb013d0ccb29923895a7b22ff2d032e3bba802dc6328301ce'
            '96e0b05a5ec72ee0f907d29fbb9612414d9dfebeee1249cbf2f2318bacf2d37c'
            'eb0c0aec5b5fb282df0bfefd4d5bbc229ee80a5c5da6760ecf52697a23cc7175'
            '6f73b6ac4b425ebc4505c7f75ca48763605b2c774c30bfa20072adcfbb1030cd')
