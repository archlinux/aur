# Maintainer: M0Rf30
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=php54
_pkgbase=${pkgbase%54}
pkgname=("${pkgbase}"
         "${pkgbase}-cgi"
         "${pkgbase}-apache"
         "${pkgbase}-fpm"
         "${pkgbase}-embed"
         "${pkgbase}-pear"
         "${pkgbase}-enchant"
         "${pkgbase}-gd"
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
source=("http://php.net/distributions/${_pkgbase}-${pkgver}.tar.bz2"
        'php.ini.patch' 'apache.conf' 'php-fpm.conf.in.patch'
        'logrotate.d.php-fpm' 'php-fpm.service' 'php-fpm.tmpfiles')

prepare() {
	cd ${srcdir}/${_pkgbase}-${pkgver}

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
	local _phpconfig="--srcdir=../${_pkgbase}-${pkgver} \
    --config-cache \
    --prefix=/usr \
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

    export EXTENSION_DIR=/usr/lib/${pkgbase}/modules
  	export PEAR_INSTALLDIR=/usr/share/${pkgbase}/pear

	msg2 "Building CLI"
	cd "$srcdir"
	rm -rf build-php
	mkdir build-php
	cd build-php
	ln -s ../${_pkgbase}-${pkgver}/configure
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
	depends=('pcre' 'libxml2' 'bzip2' 'curl')
  backup=("etc/${pkgbase}/php.ini")
	provides=("${_pkgbase}=$pkgver")

  cd ${srcdir}/build-php
  make -j1 INSTALL_ROOT=${pkgdir} install

  # install php.ini
  install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${pkgbase}/php.ini
  install -d -m755 ${pkgdir}/etc/${pkgbase}/conf.d/

  # remove static modules
  rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/*.a
  # remove modules provided by sub packages
  rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/{enchant,gd,imap,intl,ldap,mcrypt,mssql,odbc,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so

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

  # make phpize use php-config55
  sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${pkgbase/php/php-config}]], ${pkgbase/php/php-config}, no)" ${pkgdir}/usr/lib/${pkgbase}/build/phpize.m4
  }

package_php54-cgi() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-cgi=$pkgver")

	install -D -m755 ${srcdir}/build-cgi/sapi/cgi/php-cgi ${pkgdir}/usr/bin/${pkgbase}-cgi
}

package_php54-apache() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache')
	provides=("${_pkgbase}-apache=$pkgver")
	backup=("etc/httpd/conf/extra/${pkgbase}_module.conf")
	install='php-apache.install'

	install -D -m755 ${srcdir}/build-apache/libs/libphp5.so ${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${pkgbase}_module.conf
}

package_php54-fpm() {
	pkgdesc='FastCGI Process Manager for PHP'
	depends=("${pkgbase}" 'systemd')
	provides=("${_pkgbase}-fpm=$pkgver")
	backup=("etc/${pkgbase}/php-fpm.conf")
	install='php-fpm.install'

	install -d -m755 ${pkgdir}/usr/bin
	install -D -m755 ${srcdir}/build-fpm/sapi/fpm/php-fpm ${pkgdir}/usr/bin/${pkgbase}-fpm

	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.8 ${pkgdir}/usr/share/man/man8/${pkgbase}-fpm.8
	install -D -m644 ${srcdir}/build-fpm/sapi/fpm/php-fpm.conf ${pkgdir}/etc/${pkgbase}/php-fpm.conf

	install -d -m755 ${pkgdir}/etc/${pkgbase}/fpm.d
	install -D -m644 ${srcdir}/php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}-fpm.conf
	install -D -m644 ${srcdir}/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${pkgbase}-fpm.service

	install -d -m755 ${pkgdir}/etc/logrotate.d
	install -D -m644 ${srcdir}/logrotate.d.php-fpm ${pkgdir}/etc/logrotate.d/${pkgbase}-fpm
}

package_php54-embed() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-embed=$pkgver")

	install -D -m755 ${srcdir}/build-embed/libs/libphp5.so ${pkgdir}/usr/lib/libphp54.so
	install -D -m644 ${srcdir}/${_pkgbase}-${pkgver}/sapi/embed/php_embed.h ${pkgdir}/usr/include/${pkgbase}/sapi/embed/php_embed.h
}

package_php54-pear() {
	pkgdesc='PHP Extension and Application Repository'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-pear=$pkgver")
	backup=("etc/${pkgbase}/pear.conf")

	cd ${srcdir}/build-pear
	make install-pear INSTALL_ROOT=${pkgdir}
	rm -rf ${pkgdir}/usr/share/${pkgbase}/pear/.{channels,depdb,depdblock,filemap,lock,registry}

	mv ${pkgdir}/usr/bin/{pear,${pkgbase/php/pear}}
	mv ${pkgdir}/usr/bin/{peardev,${pkgbase/php/peardev}}
	mv ${pkgdir}/usr/bin/{pecl,${pkgbase/php/pecl}}

	# fix hardcoded php paths in pear
	sed -i 's|/usr/bin/php|/usr/bin/php54|g' "${pkgdir}/usr/bin/pear54"
	sed -i 's|PHP=php|PHP=php54|g' "${pkgdir}/usr/bin/pear54"
	sed -i 's|s:7:"php_bin";s:12:"/usr/bin/php"|s:7:"php_bin";s:14:"/usr/bin/php54"|' "${pkgdir}/etc/${pkgbase}/pear.conf"
}

package_php54-enchant() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')
	provides=("${_pkgbase}-enchant=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/enchant.so ${pkgdir}/usr/lib/${pkgbase}/modules/enchant.so
}

package_php54-gd() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')
	provides=("${_pkgbase}-gd=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/gd.so ${pkgdir}/usr/lib/${pkgbase}/modules/gd.so
}

package_php54-intl() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')
	provides=("${_pkgbase}-intl=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/intl.so ${pkgdir}/usr/lib/${pkgbase}/modules/intl.so
}

package_php54-ldap() {
	pkgdesc='ldap module for PHP'
	depends=("${pkgbase}" 'libldap')
	provides=("${pkgbase}-ldap=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/ldap.so ${pkgdir}/usr/lib/${pkgbase}/modules/ldap.so
}

package_php54-mcrypt() {
	pkgdesc='mcrypt module for PHP'
	depends=("${pkgbase}" 'libmcrypt' 'libltdl')
	provides=("${_pkgbase}-mcrypt=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/mcrypt.so ${pkgdir}/usr/lib/${pkgbase}/modules/mcrypt.so
}

package_php54-mssql() {
	pkgdesc='mssql module for PHP'
	depends=("${pkgbase}" 'freetds')
	provides=("${_pkgbase}-mssql=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/mssql.so ${pkgdir}/usr/lib/${pkgbase}/modules/mssql.so
}

package_php54-odbc() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')
	provides=("${_pkgbase}-odbc=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/odbc.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_odbc.so
}

package_php54-pgsql() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')
	provides=("${_pkgbase}-pgsql=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pgsql.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_pgsql.so
}

package_php54-pspell() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')
	provides=("${_pkgbase}-pspell=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/pspell.so ${pkgdir}/usr/lib/${pkgbase}/modules/pspell.so
}

package_php54-snmp() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')
	provides=("${_pkgbase}-snmp=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/snmp.so ${pkgdir}/usr/lib/${pkgbase}/modules/snmp.so
}

package_php54-sqlite() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')
	provides=("${_pkgbase}-sqlite=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/sqlite3.so ${pkgdir}/usr/lib/${pkgbase}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build-php/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_sqlite.so
}

package_php54-tidy() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidyhtml')
	provides=("${_pkgbase}-tidy=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/tidy.so ${pkgdir}/usr/lib/${pkgbase}/modules/tidy.so
}

package_php54-xsl() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')
	provides=("${_pkgbase}-xsl=$pkgver")

	install -D -m755 ${srcdir}/build-php/modules/xsl.so ${pkgdir}/usr/lib/${pkgbase}/modules/xsl.so
}

sha256sums=('4e0d28b1554c95cfaea6fa2b64aac85433f158ce72bb571bcd5574f98f4c6582'
            'e86842c3ddf499b5d27ffe5a29197a9bb2276f611b3cb6ed2351e5719e973b54'
            '8b5b15f1c348d8897d837ea9894157d9630dc542bbb0dbc7ad93c5dc0235d1d5'
            'a04d3b5ef6df6942cef218cc29c8005b4320ea859c9aea50fb6d6f8b3e350f8d'
            'c4caad0b782d175e3a463199903eb491e3f2f925e6068b72d9ce7bd9184014ba'
            '92dc7a165e9e84b46b1a510c0d89642a8d3f0fc6787c0e7c3c4ba5080c06d1b3'
            'ff65ed80264ff16e8ff8230d603a899947411538d96773dc098b399ab6c95919')
