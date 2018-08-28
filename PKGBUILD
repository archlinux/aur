# Maintainer: Pedro Junior <pedro@sysnet.net.br>
# PHP 7.0 version of the original 7.1 package from Michael Taboada.

pkgbase=php70-noconflict
_pkgbase=${pkgbase%70-noconflict}
_realpkg=${pkgbase%-noconflict}
pkgname=("${pkgbase}"
         "${_realpkg}-"{cgi,apache,fpm,embed,phpdbg,dblib,enchant,gd,imap,intl,mcrypt,odbc,pgsql,pspell,snmp,sqlite,tidy,xsl}"-noconflict")
pkgver=7.0.31
pkgrel=1
pkgdesc="php 7.0 compiled as to not conflict with php 7.1+"
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
makedepends=('apache' 'aspell' 'c-client' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt' 'libzip' 'net-snmp'
             'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc' 'curl' 'libtool' 'freetds' 'pcre')
#checkdepends=('procps-ng')

validpgpkeys=(
    '1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763'
    '6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3'
)

source=(
    "https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
    'apache.patch'
    'apache.conf'
    'enchant-2.patch'
    'php-fpm.patch'
    'php-fpm.tmpfiles'
    'php.ini.patch'
    'php-icu-1100-Utilize-the-recommended-way-to-handle-the-icu-namespace.patch'
    'php-icu-1101-Simplify-namespace-access.patch'
    'php-freetype-2.9.1.patch'
)
sha512sums=(
    'be09b810d63d0aa82ec193686f26cb2a76c16064f90a59ae5ade152cff196ece67a7e8bf1e640bf43913309c968c398231384b0b11be2b4429dd4672bcfce43e'
    '9bce62166ab26d2218a4ecc5caa7241d3fd8bed0c5e0ea86e424dc99b3bd1c7e5bc47fbc117e23fb143d10ff8d4f352909712254ab6bc610c4150f27ae668dff'
    'f5e5431993c2e0c1806c4edf392030d0b605f4b3c4cebec036e810ff771b2327983f347221735673506e2c91ce2e18ad37ab7600261b684fe29491206171b4f3'
    '30cdc281c6e288cf8a0bf58a0ad74ad5b4e8205d2b0b6ab465fad97d810f7bfae4581ad836712998e834d2e90d38cacd22f19bb01e77fc4c9d200d95613fc669'
    '2d5f3aa71ce7d8da43f0f683f81b06258e3a0d95df4807a8acac91ff89fbe60484ef97856a908bce625b1610d0004767a6a8c622246086afe2f2d464977088b5'
    'e567dbe8b348364c0efb2d96492d4747e96f835adc2b3cb0c1563049fe6cabe9b1fde8ba24b690fb5d64339673e3088b2336f8cb5aa2c85e2f9fa50efd665865'
    'fde017c6382d687b80d660253cbe5d581ca886fee0d762bf519b245c6e39677194be542ec26c71c81d104422b444a0fdadd92ac1a17e9ea1e6ec34bfb204ca7d'
    'a98bba8d648853d653946c7a379ef62760282d8856fc1f79f84d66ac3c2082ef62c2fc0ed6a6762b50560ac60168fcdf946536a99131d397e89e906ee855419c'
    '70c859feff58650ff4a291b1725bce8f290ac6d92cacc4420d3ead5cbbdbcf567cd0ed4d79fdd8b0435cf6833f7b50fff798b2fae274c5fb1bb37a0984a45f9d'
    '33d40f3ae500cf583519ecfa271e36d727c38ff4ea9547d3d2c4d51c9fadd317ed614a048077ebdb116e3c84c11db95e6455cdfc80d092d217d070c98af56525'
    '0a06189f6fb3513cd2dcf9ddb590360475e2dd9a7aa8b13ab66c389c1ed40ce2361681f017cd3c6219f5b40a0a9d4978e57ca3ee4bacb7657db3285136fd2875'
)

prepare() {
    cd ${srcdir}/${_pkgbase}-${pkgver}

    patch -p0 -i ${srcdir}/apache.patch
    patch -p0 -i ${srcdir}/php-fpm.patch
    patch -p0 -i ${srcdir}/php.ini.patch
    patch -p0 -i ${srcdir}/enchant-2.patch
    patch -p1 -i ${srcdir}/php-icu-1100-Utilize-the-recommended-way-to-handle-the-icu-namespace.patch
    patch -p1 -i ${srcdir}/php-icu-1101-Simplify-namespace-access.patch
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

package_php70-noconflict() {
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

        # make phpize use php-config70
        sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${_realpkg/php/php-config}]], ${_realpkg/php/php-config}, no)" ${pkgdir}/usr/lib/${_realpkg}/build/phpize.m4
}

package_php70-cgi-noconflict() {
	pkgdesc='CGI and FCGI SAPI for PHP'
	depends=("${pkgbase}")
	provides=("${_pkgbase}-cgi=${pkgver}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} install-cgi
}

package_php70-apache-noconflict() {
	pkgdesc='Apache SAPI for PHP'
	depends=("${pkgbase}" 'apache')
	backup=("etc/httpd/conf/extra/${_realpkg}_module.conf")
	provides=("${_pkgbase}-apache=${pkgver}")
        echo "# End of LoadModule in httpd.conf - see ArchWiki Apache HTTP Server"
        echo "LoadModule php7_module modules/libphp70.so"
        echo "AddHandler php7-script .php"
        echo "# End of Include List"
        echo "Include conf/extra/php70_module.conf"
	install -D -m755 ${srcdir}/build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/lib${_realpkg}.so
	install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/${_realpkg}_module.conf
}

package_php70-fpm-noconflict() {
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

package_php70-embed-noconflict() {
	pkgdesc='Embedded PHP SAPI library'
	depends=("${pkgbase}" 'libsystemd')
	options=('!emptydirs')
	provides=("${_pkgbase}-embed=${pkgver}")

	cd ${srcdir}/build
	make -j1 INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
# move libphp7.so to libphp-70.so -- note well: this is to prevent ldconfig
# from complaining about libphp7.so not being a symbolic link if another php7 is installed.
mv ${pkgdir}/usr/lib/libphp7.so ${pkgdir}/usr/lib/libphp-70.so
}

package_php70-phpdbg-noconflict() {
	pkgdesc='Interactive PHP debugger'
	depends=("${pkgbase}")
	options=('!emptydirs')
	provides=("${_pkgbase}-phpdbg=${pkgver}")

	cd ${srcdir}/build-phpdbg
	make -j1 INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php70-dblib-noconflict() {
	pkgdesc='dblib module for PHP'
	depends=("${pkgbase}" 'freetds')
	provides=("${_pkgbase}-dblib=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_dblib.so
}

package_php70-enchant-noconflict() {
	pkgdesc='enchant module for PHP'
	depends=("${pkgbase}" 'enchant')
	provides=("${_pkgbase}-enchant=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/enchant.so ${pkgdir}/usr/lib/${_realpkg}/modules/enchant.so
}

package_php70-gd-noconflict() {
	pkgdesc='gd module for PHP'
	depends=("${pkgbase}" 'gd')
	provides=("${_pkgbase}-gd=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/gd.so ${pkgdir}/usr/lib/${_realpkg}/modules/gd.so
}

package_php70-imap-noconflict() {
	pkgdesc='imap module for PHP'
	depends=("${pkgbase}" 'c-client')
	provides=("${_pkgbase}-imap=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/imap.so ${pkgdir}/usr/lib/${_realpkg}/modules/imap.so
}

package_php70-intl-noconflict() {
	pkgdesc='intl module for PHP'
	depends=("${pkgbase}" 'icu')
	provides=("${_pkgbase}-intl=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/intl.so ${pkgdir}/usr/lib/${_realpkg}/modules/intl.so
}

package_php70-mcrypt-noconflict() {
	pkgdesc='mcrypt module for PHP'
	depends=("${pkgbase}" 'libmcrypt' 'libtool')
	provides=("${_pkgbase}-mcrypt=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/mcrypt.so ${pkgdir}/usr/lib/${_realpkg}/modules/mcrypt.so
}

package_php70-odbc-noconflict() {
	pkgdesc='ODBC modules for PHP'
	depends=("${pkgbase}" 'unixodbc')
	provides=("${_pkgbase}-odbc=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/odbc.so ${pkgdir}/usr/lib/${_realpkg}/modules/odbc.so
	install -D -m755 ${srcdir}/build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_odbc.so
}

package_php70-pgsql-noconflict() {
	pkgdesc='PostgreSQL modules for PHP'
	depends=("${pkgbase}" 'postgresql-libs')
	provides=("${_pkgbase}-pgsql=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/pgsql.so ${pkgdir}/usr/lib/${_realpkg}/modules/pgsql.so
	install -D -m755 ${srcdir}/build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_pgsql.so
}

package_php70-pspell-noconflict() {
	pkgdesc='pspell module for PHP'
	depends=("${pkgbase}" 'aspell')
	provides=("${_pkgbase}-pspell=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/pspell.so ${pkgdir}/usr/lib/${_realpkg}/modules/pspell.so
}

package_php70-snmp-noconflict() {
	pkgdesc='snmp module for PHP'
	depends=("${pkgbase}" 'net-snmp')
	provides=("${_pkgbase}-snmp=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/snmp.so ${pkgdir}/usr/lib/${_realpkg}/modules/snmp.so
}

package_php70-sqlite-noconflict() {
	pkgdesc='sqlite module for PHP'
	depends=("${pkgbase}" 'sqlite')
	provides=("${_pkgbase}-sqlite=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/sqlite3.so ${pkgdir}/usr/lib/${_realpkg}/modules/sqlite3.so
	install -D -m755 ${srcdir}/build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${_realpkg}/modules/pdo_sqlite.so
}

package_php70-tidy-noconflict() {
	pkgdesc='tidy module for PHP'
	depends=("${pkgbase}" 'tidy')
	provides=("${_pkgbase}-tidy=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/tidy.so ${pkgdir}/usr/lib/${_realpkg}/modules/tidy.so
}

package_php70-xsl-noconflict() {
	pkgdesc='xsl module for PHP'
	depends=("${pkgbase}" 'libxslt')
	provides=("${_pkgbase}-xsl=${pkgver}")

	install -D -m755 ${srcdir}/build/modules/xsl.so ${pkgdir}/usr/lib/${_realpkg}/modules/xsl.so
}

