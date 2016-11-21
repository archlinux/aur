# Maintainer: M0Rf30
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=php54
pkgname=('php54'
         'php54-cgi'
         'php54-apache'
         'php54-fpm'
         'php54-embed'
         'php54-pear'
         'php54-enchant'
         'php54-gd'
         'php54-intl'
         'php54-ldap'
         'php54-mcrypt'
         'php54-mssql'
         'php54-odbc'
         'php54-pgsql'
         'php54-pspell'
         'php54-snmp'
         'php54-sqlite'
         'php54-tidy'
         'php54-xsl')
pkgver=5.4.45
pkgrel=2
pkgdesc="A general-purpose scripting language that is especially suited to web development"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'imap' 'postgresql-libs' 'libldap' 'postfix'
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'libpng' 'libjpeg' 'icu'
             'curl' 'libxslt' 'openssl' 'bzip2' 'db' 'gmp' 'freetype2'
             'pkg-config' 'systemd')
source=("http://php.net/distributions/${pkgbase%54}-${pkgver}.tar.bz2"
        'php.ini.patch' 'apache.conf' 'php-fpm.conf.in.patch'
        'logrotate.d.php-fpm' 'php-fpm.service' 'php-fpm.tmpfiles')

prepare() {
	cd ${srcdir}/${pkgbase%54}-${pkgver}

	# fix man pages (bug #66842)
	# sed '/.1 | xargs rm -f$/d' -i Makefile.global

	# adjust paths
	patch -p0 -i ${srcdir}/php.ini.patch
	patch -p0 -i ${srcdir}/php-fpm.conf.in.patch

	# workaround for pkg-config 0.28
	sed -e 's/ && test -n "$OPENSSL_INCS"//g' \
		-i configure

	# Just because our Apache 2.4 is configured with a threaded MPM by default does not mean we want to build a ZTS PHP.
	# Let's supress this behaviour and build a SAPI that works fine with the prefork MPM.
	sed '/APACHE_THREADED_MPM=/d' -i sapi/apache2handler/config.m4 -i configure
}

build() {
	local _phpconfig="--srcdir=../${pkgbase%54}-${pkgver} \
		--config-cache \
		--prefix=/opt/php54 \
		--sysconfdir=/etc/php54 \
		--localstatedir=/var \
		--with-layout=GNU \
		--with-config-file-path=/etc/php54 \
		--with-config-file-scan-dir=/etc/php54/conf.d \
		--enable-inline-optimization \
		--disable-debug \
		--disable-rpath \
		--disable-static \
		--enable-shared \
		--mandir=/usr/share/man \
		--without-pear \
		"

	local _phpextensions="--enable-bcmath=shared \
		--enable-calendar=shared \
		--enable-dba=shared \
		--enable-exif=shared \
		--enable-ftp=shared \
		--enable-gd-native-ttf \
		--enable-intl=shared \
		--enable-json=shared \
		--enable-mbregex \
		--enable-mbstring \
		--enable-pdo \
		--enable-phar=shared \
		--enable-posix=shared \
		--enable-session \
		--enable-shmop=shared \
		--enable-soap=shared \
		--enable-sockets=shared \
		--enable-sysvmsg=shared \
		--enable-sysvsem=shared \
		--enable-sysvshm=shared \
		--enable-xml \
		--enable-zip=shared \
		--with-bz2=shared \
		--with-curl=shared \
		--with-db4=/usr \
		--with-enchant=shared,/usr \
		--with-freetype-dir=shared,/usr \
		--with-gd=shared \
		--with-gdbm=shared \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-icu-dir=/usr \
		--with-imap-ssl=shared \
		--with-imap=shared \
		--with-kerberos=/usr \
		--with-jpeg-dir=shared,/usr \
		--with-ldap=shared \
		--with-ldap-sasl \
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
		--with-png-dir=shared,/usr \
		--with-pspell=shared \
		--with-regex=php \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		--with-zlib \
		--without-db2 \
		--without-db3 \
		"

	export EXTENSION_DIR=/opt/php54/modules
	export PEAR_INSTALLDIR=/opt/php54/pear

	msg2 "Building CLI"
	cd "$srcdir"
	rm -rf build-php
	mkdir build-php
	cd build-php
	ln -s ../${pkgbase%54}-${pkgver}/configure
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		${_phpextensions}
	make

	msg2 "Building cgi/fcgi API"
	cd "$srcdir"
	rm -rf build-cgi
	cp -a build-php build-cgi
	cd build-cgi
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-cgi \
		${_phpextensions}
	make

	msg2 "Building apache API"
	cp -a ${srcdir}/build-php ${srcdir}/build-apache
	cd ${srcdir}/build-apache
	./configure ${_phpconfig} \
		--disable-cli \
		--with-apxs2 \
		${_phpextensions}
	make

	msg2 "Building FPM API"
	cd "$srcdir"
	rm -rf build-fpm
	cp -a build-php build-fpm
	cd build-fpm
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-fpm \
		--with-fpm-user=http \
		--with-fpm-group=http \
		${_phpextensions}
	make

	msg2 "Building Embed"
	# embed
	cp -a ${srcdir}/build-php ${srcdir}/build-embed
	cd ${srcdir}/build-embed
	./configure ${_phpconfig} \
		--disable-cli \
		--enable-embed=shared \
		${_phpextensions}
	make

	msg2 "Building PEAR"
	cd "$srcdir"
	rm -rf build-pear
	cp -a build-php build-pear
	cd build-pear
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear \
		${_phpextensions}
	make
}

# check() {
# 	cd ${srcdir}/build-php
# 	make test
# }

package_php54() {
	pkgdesc='An HTML-embedded scripting language'
	provides=("php=$pkgver")
	depends=('pcre' 'libxml2' 'bzip2' 'curl')
	backup=('etc/php54/php.ini')

	cd ${srcdir}/build-php
	make -j1 INSTALL_ROOT=${pkgdir} install

	# install php.ini
	install -D -m644 ${srcdir}/${pkgbase%54}-${pkgver}/php.ini-production ${pkgdir}/etc/php54/php.ini
	install -d -m755 ${pkgdir}/etc/php54/conf.d/

	# links
	install -dm755 "$pkgdir/usr/bin"
	for bin in php phar; do
		ln -s /opt/php54/bin/$bin "$pkgdir/usr/bin/${bin}54"
	done

	# remove conflicting files
	rm -rf ${pkgdir}/usr/share/man

	# remove static modules
	rm -f ${pkgdir}/opt/php54/modules/*.a
	# remove modules provided by sub packages
	rm -f ${pkgdir}/opt/php54/modules/{enchant,gd,intl,ldap,mcrypt,mssql,odbc,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so
}

package_php54-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=('php54')

	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/opt/php54/bin/php-cgi
}

package_php54-apache() {
	pkgdesc='Apache SAPI for PHP'
# 	conflicts="php-apache"
	depends=('php54' 'apache')
	backup=('etc/httpd/conf/extra/php5_module.conf')

	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/libphp5.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/php5_module.conf
}

package_php54-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=('php54' 'systemd')
	backup=('etc/php54/php-fpm.conf')
	install='php-fpm.install'

	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/opt/php54/bin/php-fpm
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/etc/php54/php-fpm.conf
	install -D -m644 ${srcdir}/logrotate.d.php-fpm ${pkgdir}/etc/logrotate.d/php54-fpm
	install -d -m755 ${pkgdir}/etc/php54/fpm.d
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/php54-fpm.conf
	install -D -m644 ${srcdir}/php-fpm.service ${pkgdir}/usr/lib/systemd/system/php54-fpm.service
}

package_php54-embed() {
	pkgdesc='Embed SAPI for PHP'
	depends=('php54')

	install -D -m755 ${srcdir}/build-embed/libs/libphp5.so ${pkgdir}/opt/php54/lib/libphp5.so
	install -D -m644 ${srcdir}/php-${pkgver}/sapi/embed/php_embed.h ${pkgdir}/opt/php54/include/php/sapi/embed/php_embed.h
}

package_php54-pear() {
	pkgdesc='PHP Extension and Application Repository'
	depends=('php54')
	backup=('etc/php54/pear.conf')

	cd ${srcdir}/build-pear
	make -j1 install-pear INSTALL_ROOT=${pkgdir}
	local i
	while read i; do
		[ ! -e "$i" ] || rm -rf "$i"
	done < <(find ${pkgdir} -name '.*')

	# links
	install -dm755 "$pkgdir/usr/bin"
	for bin in pear pecl; do
		ln -s /opt/php54/bin/$bin "$pkgdir/usr/bin/${bin}54"
	done
}

package_php54-enchant() {
	depends=('php54' 'enchant')
	pkgdesc='enchant module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/opt/php54/modules/enchant.so
}

package_php54-gd() {
	depends=('php54' 'libpng' 'libjpeg' 'freetype2')
	pkgdesc='gd module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/opt/php54/modules/gd.so
}

package_php54-intl() {
	depends=('php54' 'icu')
	pkgdesc='intl module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/opt/php54/modules/intl.so
}

package_php54-ldap() {
	depends=('php54' 'libldap')
	pkgdesc='ldap module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/opt/php54/modules/ldap.so
}

package_php54-mcrypt() {
	depends=('php54' 'libmcrypt' 'libltdl')
	pkgdesc='mcrypt module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/opt/php54/modules/mcrypt.so
}

package_php54-mssql() {
	depends=('php54' 'freetds')
	pkgdesc='mssql module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/mssql.so ${pkgdir}/opt/php54/modules/mssql.so
}

package_php54-odbc() {
	depends=('php54' 'unixodbc')
	pkgdesc='ODBC modules for PHP'
	install -D -m755 ${srcdir}/build-php/modules/odbc.so ${pkgdir}/opt/php54/modules/odbc.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_odbc.so ${pkgdir}/opt/php54/modules/pdo_odbc.so
}

package_php54-pgsql() {
	depends=('php54' 'postgresql-libs')
	pkgdesc='PostgreSQL modules for PHP'
	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/opt/php54/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/opt/php54/modules/pdo_pgsql.so
}

package_php54-pspell() {
	depends=('php54' 'aspell')
	pkgdesc='pspell module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/opt/php54/modules/pspell.so
}

package_php54-snmp() {
	depends=('php54' 'net-snmp')
	pkgdesc='snmp module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/opt/php54/modules/snmp.so
}

package_php54-sqlite() {
	depends=('php54' 'sqlite')
	pkgdesc='sqlite module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/opt/php54/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/opt/php54/modules/pdo_sqlite.so
}

package_php54-tidy() {
	depends=('php54' 'tidyhtml')
	pkgdesc='tidy module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/opt/php54/modules/tidy.so
}

package_php54-xsl() {
	depends=('php54' 'libxslt')
	pkgdesc='xsl module for PHP'
	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/opt/php54/modules/xsl.so
}

sha256sums=('4e0d28b1554c95cfaea6fa2b64aac85433f158ce72bb571bcd5574f98f4c6582'
            '5498ed2eb6ca5c96384873c2c83db36df82af79100e7543a6d0b17539e0304e2'
            '6ee6ed48b8416390c56b2e32b75c79f85586431b5c44c48ed22ae6a8dbe68332'
            '63d88e95e1ef6e9bed1a695cb56f4c1e2dc768077c64fce45f927b6bee8b1dbf'
            '185d18221b09a43a0d5a05f9d3455f2f5514bb2b4751df98f297a3b4983c6fdb'
            '72eb165f7074df22a623428b71b03269e7e4d41cae14da41166ec746ab18cd92'
            '640dba0d960bfeaae9ad38d2826d3f6b5d6c175a4d3e16664eefff29141faad5')
