# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"

_sed_args=(-e 's|/var/run|/run|g' -e 's|/usr/sbin|/usr/bin|g')
_prefix=true

$_prefix && _sed_args+=(-e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g')

pkgbase=openrc-devel
pkgname=('jenkins-openrc'
	'git-openrc'
	'mysql-openrc'
	'postgresql-openrc'
	'subversion-openrc'
	'distcc-openrc')
       # 'php-fpm-openrc')
pkgver=20170309
pkgrel=1
pkgdesc="OpenRC init scripts"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL2')
groups=('openrc-devel')
conflicts=('systemd-sysvcompat')
source=("git-daemon.confd::${_url}/dev-vcs/git/files/git-daemon.confd"
        "git-daemon.initd::${_url}/dev-vcs/git/files/git-daemon-r1.initd"
        "mysql.confd::${_url}/dev-db/mysql-init-scripts/files/conf.d-2.0"
        "mysql.initd::${_url}/dev-db/mysql-init-scripts/files/init.d-2.0"
        "svn.confd::${_url}/dev-vcs/subversion/files/svnserve.confd"
        "svn.initd::${_url}/dev-vcs/subversion/files/svnserve.initd3"
        "postgresql.confd::${_url}/dev-db/postgresql/files/postgresql.confd"
        "postgresql.initd::${_url}/dev-db/postgresql/files/postgresql.init-9.3"
        "distccd.confd::${_url}/sys-devel/distcc/files/3.2/conf"
        "distccd.initd::${_url}/sys-devel/distcc/files/3.2/init"
	'jenkins.initd'
	"jenkins.logrotate")
# 	"php-fpm.initd::${_url}/dev-lang/php/files/php-fpm-r4.init")

sha256sums=('4703ba2372c661fb674a29fea7f64983f8b1b3136d971663509249655bca6e21'
            'c39eff8e0d0156f035b987521444476875852519ddfe6b36ea5c205d93a7f323'
            'b94756f2a5fe43893dea90fadbe47308e50fb4dbe2cbaa2676f34fa88181d8e7'
            'b6eb4576e654b1f4a8138df04408935a07fab69775e9663f736133c71bbb414b'
            '45f2dc1a718aed885559e71d98112e670c92bd6b4f19c5cf593eced6cd2bbd97'
            '3cba218e648f7722e6e5541deb9e8ca0f53188195e33b17ca19efb8a300651cb'
            '57c1ad0b14e8458024c713dd8cc2390023b95c27ba4cbd637333b1020f11f398'
            '120e872848eb13c949179b22f00a31bd043823ac75c547374225c6c3620a827d'
            '253cfaa5b53fe4943a9db83e76ff6d6e8855665f69c2f7beca124af3ec63c88a'
            '4af1591a0f95e45648f0c5a7ffc5e49be012f2f6e497235b3363e9e709dc627f'
            '7ef50b386bef359224dffb964387f651aa02cd610c3f73d585fa3ae78e9becee'
            '03dcaccbb0d398c2b600be0752ffc68d20c877b58a10026b7c59b0bd40c0e5bf')

pkgver() {
	date +%Y%m%d
}

_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed ${_sed_args[@]} -i ${pkgdir}/etc/init.d/$1
}

_inst_confd(){
	install -Dm755 ${srcdir}/$1.confd ${pkgdir}/etc/conf.d/$1
}

package_git-openrc() {
	pkgdesc="OpenRC git-daemon init script"
	depends=('git' 'openrc')
	backup=('etc/conf.d/git-daemon')

	_inst_confd 'git-daemon'
	_inst_initd 'git-daemon'

	sed -e 's|/var/git|/srv/git|' -i "${pkgdir}/etc/conf.d/git-daemon"
}

package_mysql-openrc() {
	pkgdesc="OpenRC mysql init script"
	depends=('mysql' 'openrc')
	optdepends=('bind-openrc: bind initscript')
	backup=('etc/conf.d/mysql')
	install=mysql.install

	_inst_confd 'mysql'
	_inst_initd 'mysql'

	sed -e 's|/sbin/mysqld|/bin/mysqld|g' -i "${pkgdir}/etc/init.d/mysql"
}

package_postgresql-openrc() {
	pkgdesc="OpenRC postgresql init script"
	depends=('postgresql' 'openrc')
	backup=('etc/conf.d/postgresql')
	install=postgresql.install

	_inst_confd 'postgresql'
	_inst_initd 'postgresql'

	sed -e 's|/etc/postgresql-@SLOT@/|/var/lib/postgres/data/|' \
		-e 's|/var/lib/postgresql/@SLOT@/data|/var/lib/postgres/data|' \
		-i "${pkgdir}/etc/conf.d/postgresql"

	sed -e 's|/@LIBDIR@/postgresql-@SLOT@||g' \
		-e 's|/etc/conf.d/postgresql-@SLOT@|/etc/conf.d/postgresql|' \
		-i "${pkgdir}/etc/init.d/postgresql"
}

package_subversion-openrc() {
	pkgdesc="OpenRC svnserve init script"
	depends=('subversion' 'openrc')
	backup=('etc/conf.d/svn')

	_inst_confd 'svn'
	_inst_initd 'svn'

	sed -e 's|/var/svn|/srv/svn|g' -i ${pkgdir}/etc/conf.d/svn

	sed -e 's|/var/svn|/srv/svn|g' \
		-e 's|-apache|-http|g' \
		-e 's|/run/svnserve.pid|/run/svnserve/svnserve.pid|g' \
		-e 's/--make-pidfile//' \
		-i "${pkgdir}/etc/init.d/svn"
}

package_distcc-openrc() {
	pkgdesc="OpenRC distcc init script"
	depends=('distcc' 'openrc')
	backup=('etc/conf.d/distccd')

	_inst_confd 'distccd'
	_inst_initd 'distccd'

	sed -e 's|/var/run|/run|' -i ${pkgdir}/etc/conf.d/distccd
}

package_jenkins-openrc() {
	pkgdesc="OpenRC jenkins init script"
	depends=('jenkins' 'openrc')

	_inst_initd 'jenkins'

	install -Dm644 "${srcdir}/jenkins.logrotate" "${pkgdir}/etc/logrotate.d/jenkins"
}

# package_php-fpm-openrc() {
# 	pkgdesc="OpenRC php-fpm init script"
# 	depends=('php-fpm' 'openrc')
# 	optdepends=('apache-openrc: apache initscript'
# 			'lighttp-openrc: lighttp initscript'
# 			'nginx-openrc: nginx initscript')
# 	install=php-fpm.install
#
# 	_inst_initd 'php-fpm'
#
# 	sed -e 's|/lib/${PHPSLOT}||g' \
# 		-e 's|/etc/php/fpm-${PHPSLOT}|/etc/php|' \
# 		-e 's|/run/php-fpm-${PHPSLOT}|/run/php-fpm|' \
# 		-e 's|PHPSLOT=${SVCNAME#php-fpm-}||' \
# 		-e 's|^.*${PHPSLOT}.*||' \
# 		-i "${pkgdir}/etc/init.d/php-fpm"
# }
