# $Id$
# Original: Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Maintainer of forked PHP package: Marc Cousin <cousinmarc@gmail.com>

pkgbase=php
pkgname=('php-32-fopen'
         'php-cgi'
         'php-apache'
         'php-fpm'
         'php-embed'
         'php-phpdbg'
         'php-dblib'
         'php-enchant'
         'php-gd'
         'php-imap'
         'php-intl'
         'php-sodium'
         'php-odbc'
         'php-pgsql'
         'php-pspell'
         'php-snmp'
         'php-sqlite'
         'php-tidy'
         'php-xsl')
pkgver=7.2.6
pkgrel=1
arch=('x86' 'armv7h')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libsodium' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'postfix' 'freetds' 'pcre' 'libnsl')
checkdepends=('procps-ng')
provides=('php')
conflicts=('php')
source=("https://php.net/distributions/${pkgbase}-${pkgver}.tar.xz"{,.asc}
        'apache.patch' 'apache.conf' 'php-fpm.patch' 'php-fpm.tmpfiles' 'php.ini.patch'
        'enchant-2.patch' 'freetype.patch')
sha512sums=('1d49fc6e47d2e86d4fd62396e558965502f44cc8f72459bb0d406e157298cac67703b219837952da11122722d9fa8cb4cda8ef66ddf063cb063859db34110f58'
            'SKIP'
            'bb9abfc51c41e1de180ef09244691c909ee64feebd9749978e1ecb7f576466a37232d9c6e97c1a01a96b8413a33c4818a91dc79f63078dc1946f56dad516bb05'
            'eccbe1a0c7b2757ab3c982c871cc591a66ad70f085aaa0d44f93cacacedc7b8fd21b8d0c66471327ff070db1bab1ab83a802f6fa190f33bdd74c134975e3910e'
            'c5d57a4d06d33856082a461a6796975ec42b655e81abe14bc896692d44b5c28e9b344111e64d13af486168b3dc927d908705e543095f34052f72198f257b4c34'
            '824e9a0d10063283357d49a81ab49bf834afd24f098482bdbaa9ab60bbad2b0dea6f5879259b73717d437626b02fb4f2d3ef68b7bcbb26bee274a7b61144720f'
            '85000bcb4f5674bfcbac7f32aeb28c523904a23da716e7fd982ac225845843e0acb33c0b8552107c234b1dd106337ad0a6792253f200980b88a6f6239ec982d0'
            '06b49fb044fe8cdeef5109aa7bb6858906396e3f3643827cdb241264029579c71b0a7661d24b78b16573c54832505491c4b2a1fd77ae7c313cb082731c2efd9e'
            '97ca469d5234f5cc71af38bb99a60130fdab5f849ad1f49f112101779c7659ca4d6700aef72e0294c85bdcb18e487fc0cdda855cc51084b9e8cacb02ec0fb1eb')
validpgpkeys=('B1B44D8F021E4E2D6021E995DC9FF8D3EE5AF27F'
              '1729F83938DA44E27BA0F4D3DBDB397470D12172')

prepare() {
	cd ${srcdir}/${pkgbase}-${pkgver}

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
	CFLAGS+=' -D_FILE_OFFSET_BITS=64'

	local _phpconfig="--srcdir=../${pkgbase}-${pkgver} \
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

	EXTENSION_DIR=/usr/lib/php/modules
	export EXTENSION_DIR

	mkdir ${srcdir}/build
	cd ${srcdir}/build
	ln -s ../${pkgbase}-${pkgver}/configure
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
	cd ${srcdir}/${pkgbase}-${pkgver}

	# Check if sendmail was configured correctly (FS#47600)
	${srcdir}/build/sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

	export REPORT_EXIT_STATUS=1
	export NO_INTERACTION=1
	export SKIP_ONLINE_TESTS=1
	export SKIP_SLOW_TESTS=1

	#${srcdir}/build/sapi/cli/php -n run-tests.php -n -P {tests,Zend}
	echo 1
}

package_php() {
	pkgdesc='A general-purpose scripting language that is especially suited to web development, patched version to not error on large files on 32 bits system'
	depends=('libxml2' 'curl' 'libzip' 'pcre' 'argon2')
	replaces=('php-ldap')
	conflicts=('php-ldap')
	provides=("php-ldap=${pkgver}")
	backup=('etc/php/php.ini')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
	install -D -m644 ${srcdir}/${pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/php/php.ini
	install -d -m755 ${pkgdir}/etc/php/conf.d/

	# remove static modules
	rm -f ${pkgdir}/usr/lib/php/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/usr/lib/php/modules/{enchant,gd,imap,intl,sodium,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
	# remove empty directory
	rmdir ${pkgdir}/usr/include/php/include
}

package_php-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=('php')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=('php' 'apache' 'libnsl')
	backup=('etc/httpd/conf/extra/php7_module.conf')

	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/libphp7.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php7_module.conf
}

package_php-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=('php' 'systemd')
	backup=('etc/php/php-fpm.conf' 'etc/php/php-fpm.d/www.conf')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-fpm
	install -D -m644 sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/php-fpm.service
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/php-fpm.conf
}

package_php-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=('php' 'libsystemd' 'libnsl')
	options=('!emptydirs')

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
}

package_php-phpdbg() {
	pkgdesc='Interactive PHP debugger'
	depends=('php')
	options=('!emptydirs')

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php-dblib() {
	pkgdesc='dblib module for PHP'
	depends=('php' 'freetds')

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/php/modules/pdo_dblib.so
}

package_php-enchant() {
	pkgdesc='enchant module for PHP'
	depends=('php' 'enchant')

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/php/modules/enchant.so
}

package_php-gd() {
	pkgdesc='gd module for PHP'
	depends=('php' 'gd')

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/php/modules/gd.so
}

package_php-imap() {
	pkgdesc='imap module for PHP'
	depends=('php' 'c-client')

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/php/modules/imap.so
}

package_php-intl() {
	pkgdesc='intl module for PHP'
	depends=('php' 'icu')

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/php/modules/intl.so
}

package_php-sodium() {
	pkgdesc='sodium module for PHP'
	depends=('php' 'libsodium')

	install -D -m755 ${srcdir}/build/modules/sodium.so ${pkgdir}/usr/lib/php/modules/sodium.so
}

package_php-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=('php' 'unixodbc')

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/php/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/php/modules/pdo_odbc.so
}

package_php-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=('php' 'postgresql-libs')

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/php/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/php/modules/pdo_pgsql.so
}

package_php-pspell() {
	pkgdesc='pspell module for PHP'
	depends=('php' 'aspell')

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/php/modules/pspell.so
}

package_php-snmp() {
	pkgdesc='snmp module for PHP'
	depends=('php' 'net-snmp')

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/php/modules/snmp.so
}

package_php-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=('php' 'sqlite')

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/php/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/php/modules/pdo_sqlite.so
}

package_php-tidy() {
	pkgdesc='tidy module for PHP'
	depends=('php' 'tidy')

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/php/modules/tidy.so
}

package_php-xsl() {
	pkgdesc='xsl module for PHP'
	depends=('php' 'libxslt')

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/php/modules/xsl.so
}
