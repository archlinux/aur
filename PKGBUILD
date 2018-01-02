# Maintainer: preparationh67 <preparationh67 at gmail.com>

_pkgbase=php
_phpver=7.2.0
_pkgname=php-pear
pkgname=php-pear-src
pkgver=1.10.5
pkgrel=3
pkgdesc="PHP Extension and Application Repository"
arch=('i686' 'x86_64')
license=('PHP')
conflicts=('php-pear')
url='http://pear.php.net'
makedepends=('apache' 'c-client' 'postgresql-libs' 'libldap' 'smtp-forwarder'
             'sqlite' 'unixodbc' 'net-snmp' 'libzip' 'enchant' 'file' 'freetds'
             'libmcrypt' 'tidyhtml' 'aspell' 'libltdl' 'gd' 'icu'
             'curl' 'libxslt' 'openssl' 'db' 'gmp' 'systemd')

source=("http://php.net/distributions/${_pkgbase}-${_phpver}.tar.xz"
	"http://php.net/distributions/${_pkgbase}-${_phpver}.tar.xz.asc")

validpgpkeys=('528995BFEDFBA7191D46839EF9BA0ADA31CBD89E'
	      'B1B44D8F021E4E2D6021E995DC9FF8D3EE5AF27F')

build() {
	local _phpconfig="--srcdir=../${_pkgbase}-${_phpver} \
		--config-cache \
		--prefix=/usr \
		--sysconfdir=/etc/${_pkgbase} \
		--localstatedir=/var \
		--libdir=/usr/lib/${_pkgbase} \
		--datarootdir=/usr/share/${_pkgbase} \
		--datadir=/usr/share/${_pkgbase} \
		--with-layout=GNU \
		--with-config-file-path=/etc/${_pkgbase} \
		--with-config-file-scan-dir=/etc/${_pkgbase}/conf.d \
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
		--enable-mbstring \
		--enable-opcache \
		--enable-phar=shared \
		--enable-posix=shared \
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
		--with-fpm-systemd \
		--with-freetype-dir=/usr \
		--with-xpm-dir=/usr \
		--with-gd=shared,/usr \
		--with-gdbm \
		--with-gettext=shared \
		--with-gmp=shared \
		--with-iconv=shared \
		--with-icu-dir=/usr \
		--with-imap-ssl \
		--with-imap=shared \
		--with-kerberos=/usr \
		--with-jpeg-dir=/usr \
		--with-vpx-dir=/usr \
		--with-ldap=shared \
		--with-ldap-sasl \
		--with-libzip \
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
		--with-png-dir=/usr \
		--with-pspell=shared \
		--with-snmp=shared \
		--with-sqlite3=shared,/usr \
		--with-tidy=shared \
		--with-unixODBC=shared,/usr \
		--with-xmlrpc=shared \
		--with-xsl=shared \
		"

	export EXTENSION_DIR=/usr/lib/${_pkgbase}/modules
	export PEAR_INSTALLDIR=/usr/share/${_pkgbase}/pear

	cd ${srcdir}/${_pkgbase}-${_phpver}
	# pear
	mkdir ${srcdir}/build-pear
	cd ${srcdir}/build-pear
	ln -sf ../${_pkgbase}-${_phpver}/configure
	./configure ${_phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear \
		${_phpextensions}
	make
}

package() {
	pkgdesc='PHP Extension and Application Repository'
	depends=("${_pkgbase}")
	provides=("${_pkgbase}-pear=$pkgver")
	backup=("etc/${_pkgbase}/pear.conf")

	cd ${srcdir}/build-pear
	make install-pear INSTALL_ROOT=${pkgdir}
	rm -rf ${pkgdir}/usr/share/${_pkgbase}/pear/.{channels,depdb,depdblock,filemap,lock,registry}

}
md5sums=('ef8d4764f16d5f066e9893fe91887a31'
         'SKIP')
