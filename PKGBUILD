# Maintainer: artoo <artoo@manjaro.org>

_gentoo_uri="http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86"

pkgbase=openrc-devel
pkgname=('git-openrc'
		'mysql-openrc'
		'postgresql-openrc'
		'subversion-openrc'
		'php-fpm-openrc')
pkgver=20150613
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-devel')
conflicts=('openrc'
		'openrc-git'
		'openrc-arch-services-git'
		'initscripts'
		'systemd-sysvcompat')
source=("git-daemon.confd::${_gentoo_uri}/dev-vcs/git/files/git-daemon.confd"
		"git-daemon.initd::${_gentoo_uri}/dev-vcs/git/files/git-daemon-r1.initd"
		"mysql.confd::${_gentoo_uri}/dev-db/mysql-init-scripts/files/conf.d-2.0"
		"mysql.initd::${_gentoo_uri}/dev-db/mysql-init-scripts/files/init.d-2.0"
		"svn.confd::${_gentoo_uri}/dev-vcs/subversion/files/svnserve.confd"
		"svn.initd::${_gentoo_uri}/dev-vcs/subversion/files/svnserve.initd3"
		"postgresql.confd::${_gentoo_uri}/dev-db/postgresql/files/postgresql.confd"
		"postgresql.initd::${_gentoo_uri}/dev-db/postgresql/files/postgresql.init-9.3"
		"php-fpm.initd::${_gentoo_uri}/dev-lang/php/files/php-fpm-r4.init")
sha256sums=('9bf02170dcf73e930a992adf44326ed7c27159d41a503ca4d9371861ee5030c9'
            '421e68201619bfbf7535d8b1a0030390b7ffab998e025f7cbd7e879c677c2819'
            '6cd8551b8ac0dded54f42c2cc9cd55fbc4776d1a541e13d7d571cefd906cb3f4'
            '1c89b70714bac5edece71ecc113a35350fc96ef977be2e0f44d6b46adbbb6c30'
            '45f2dc1a718aed885559e71d98112e670c92bd6b4f19c5cf593eced6cd2bbd97'
            'b5bd2a3b09c5e84d385e5d873ad9e3061a6e05dcf59276d6a38a5b86f180eb77'
            '57c1ad0b14e8458024c713dd8cc2390023b95c27ba4cbd637333b1020f11f398'
            '6a22c5d3bcacbe21f03663a318131fb692aa321abd4db36c3a013a7964685143'
            '37e34461babfb5881169f9729fbdde7d4aba533f123e2c480fe25ac3b863d3e7')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-e 's|/usr/sbin|/usr/bin|g' \
		-i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_git-openrc() {
	pkgdesc="OpenRC git-daemon init script"
	depends=('git' 'openrc-core')
	backup=('etc/conf.d/git-daemon')
	install=git.install

	_inst_confd 'git-daemon'
	_inst_initd 'git-daemon'

	sed -e 's|/var/git|/srv/git|' -i "${pkgdir}/etc/conf.d/git-daemon"
}

package_mysql-openrc() {
	pkgdesc="OpenRC mysql init script"
	depends=('mysql' 'openrc-core')
	optdepends=('bind-openrc: bind initscript')
	backup=('etc/conf.d/mysql')
	install=mysql.install

	_inst_confd 'mysql'
	_inst_initd 'mysql'

	sed -e 's|/sbin/mysqld|/bin/mysqld|g' -i "${pkgdir}/etc/init.d/mysql"
}

package_php-fpm-openrc() {
	pkgdesc="OpenRC php-fpm init script"
	depends=('php-fpm' 'openrc-core')
	optdepends=('apache-openrc: apache initscript'
			'lighttp-openrc: lighttp initscript'
			'nginx-openrc: nginx initscript')
	install=php-fpm.install

	_inst_initd 'php-fpm'

	sed -e 's|/lib/${PHPSLOT}||g' \
		-e 's|/etc/php/fpm-${PHPSLOT}|/etc/php|' \
		-e 's|/run/php-fpm-${PHPSLOT}|/run/php-fpm|' \
		-e 's|PHPSLOT=${SVCNAME#php-fpm-}||' \
		-e 's|^.*${PHPSLOT}.*||' \
		-i "${pkgdir}/etc/init.d/php-fpm"
}

package_postgresql-openrc() {
	pkgdesc="OpenRC postgresql init script"
	depends=('postgresql' 'openrc-core')
	backup=('etc/conf.d/postgresql')
	install=postgresql.install

	_inst_confd 'postgresql'
	_inst_initd 'postgresql'

	sed -e 's|/@LIBDIR@/postgresql-@SLOT@||g' \
		-e 's|/etc/conf.d/postgresql-@SLOT@|/etc/conf.d/postgresql|' \
		-i "${pkgdir}/etc/init.d/postgresql"
}

package_subversion-openrc() {
	pkgdesc="OpenRC svnserve init script"
	depends=('subversion' 'openrc-core')
	backup=('etc/conf.d/svn')
	install=subversion.install

	_inst_confd 'svn'
	_inst_initd 'svn'

	sed -e 's|/var/svn|/srv/svn|g' -i ${pkgdir}/etc/conf.d/svn

	sed -e 's|/var/svn|/srv/svn|g' \
		-e 's|-apache|-http|g' \
		-e 's|/run/svnserve.pid|/run/svnserve/svnserve.pid|g' \
		-e 's/--make-pidfile//' \
		-i "${pkgdir}/etc/init.d/svn"
}
