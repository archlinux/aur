# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Danny Navarro <j@dannynavarro.net>

pkgname=mysql51
_tarball=5.1.73
pkgver=5.1.77
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A fast SQL database server, version 5.1.x"
backup=('etc/mysql/my.cnf')
url="https://www.mysql.com/products/community/"
depends=('openssl' 'gcc-libs')
makedepends=('zlib' 'perl' 'libtool' 'bison27' 'git')
optdepends=('perl-dbi' 'perl-dbd-mysql')
options=('!libtool')
conflicts=('mysql' 'mariadb' 'libmysqlclient' 'libmariadbclient' 'mysql-clients' 'mariadb-clients')
provides=('mysql' 'libmysqlclient' 'mysql-clients')
install="${pkgname}.install"
source=("http://ftp.gwdg.de/pub/misc/mysql/Downloads/MySQL-5.1/mysql-${_tarball}.tar.gz"{,.asc}
        "https://github.com/mysql/mysql-server/compare/mysql-${_tarball}...mysql-${pkgver}.patch"
        'mysqld.service'
        'mysqld@.service'
        'mysqld-tmpfile.conf'
        'mysqld-post.sh'
        'my.cnf'
        'skip-abi-check.patch')
sha256sums=('05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5'
            'SKIP'
            'a5f38b17d30ec1a2d6c0c135b4ca8975f8e8e1a818e2a09d66952417484f894f'
            'f609540cbcedb4a16b8e9eaaf3b537e8af45127e09a7480ce411ca80026aa90c'
            'c96471716d5a65bdefd88cab7ed2330353e5e07ee9d0cbfd53fbd41b536ed0cd'
            '2af318c52ae0fe5428e8a9245d1b0fc3bc5ce153842d1563329ceb1edfa83ddd'
            '9e98b2f942b407032f3a98914dc1d9a6a4bfe09d10b652bc040b0c213fc7a91b'
            'ff0a55a4c7a5b8a3e0aca6d9d2238a126748a6c3d3cd28b6d09a12d4dc881f4c'
            '6a3c4702097bd7e5575030d4c37ca7d628ff9f2d6ed499ca3f55638a3f99668e')
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')

prepare() {
	cd "${srcdir}/mysql-${_tarball}"

	# latest version from gitub
	git apply --exclude="mysql-test/*" --verbose "${srcdir}/mysql-${_tarball}...mysql-${pkgver}.patch"

	patch -Np0 -i "${srcdir}/skip-abi-check.patch"
}

build() {
	cd "${srcdir}/mysql-${_tarball}"

	# CFLAGS/CXXFLAGS as suggested upstream
	CFLAGS="-fPIC ${CFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -fomit-frame-pointer" \
	CXXFLAGS="-fPIC ${CXXFLAGS} -fno-strict-aliasing -DBIG_JOINS=1 -felide-constructors -fno-rtti" \
	./configure --prefix=/usr \
		--libexecdir=/usr/sbin \
		--localstatedir=/var \
		--sysconfdir=/etc/mysql \
		--without-docs \
		--with-readline \
		--without-libedit \
		--with-ssl \
		--with-zlib-dir=/usr \
		--with-charset=utf8 \
		--with-collation=utf8_general_ci \
		--with-extra-charsets=complex \
		--with-embedded-server \
		--with-unix-socket-path=/run/mysqld/mysqld.sock \
		--enable-local-infile \
		--with-plugins=innobase,innodb_plugin \
		--datarootdir=/usr/share \
		--localstatedir=/var/lib/mysql
	make
}

package() {
	cd "${srcdir}/mysql-${_tarball}"

	make DESTDIR=${pkgdir} install

	# create library symlinks in /usr/lib
	ln -sf mysql/libmysqlclient.so.16 ${pkgdir}/usr/lib/libmysqlclient.so.16
	ln -sf libmysqlclient.so.16 ${pkgdir}/usr/lib/libmysqlclient.so
	ln -sf libmysqlclient.so.16 ${pkgdir}/usr/lib/libmysqlclient.so.1
	ln -sf mysql/libmysqlclient_r.so.16  ${pkgdir}/usr/lib/libmysqlclient_r.so.16
	ln -sf libmysqlclient_r.so.16 ${pkgdir}/usr/lib/libmysqlclient_r.so
	ln -sf libmysqlclient_r.so.16 ${pkgdir}/usr/lib/libmysqlclient_r.so.1

	install -D -m0644 ${srcdir}/my.cnf ${pkgdir}/etc/mysql/my.cnf
	install -D -m0644 ${srcdir}/mysqld.service ${pkgdir}/usr/lib/systemd/system/mysqld.service
	install -D -m0644 ${srcdir}/mysqld@.service ${pkgdir}/usr/lib/systemd/system/mysqld@.service
	install -D -m0644 ${srcdir}/mysqld-tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/mysqld.conf
	install -D -m0755 ${srcdir}/mysqld-post.sh ${pkgdir}/usr/bin/mysqld-post

	rm -r ${pkgdir}/usr/{sql-bench,mysql-test}

	install -d -m0700 ${pkgdir}/var/lib/mysql
}

