# Maintainer: Pavol Hluchy (Lopo) <lopoATlosysDOTeu>
# based on original squirrelmail package by darose

pkgname=squirrelmail-dev-svn
pkgver=r14832
pkgrel=1
_svnmod='squirrelmail'
pkgdesc='Webmail for Nuts! (Development version Subversion source)'
arch=('any')
license=('GPL')
url="http://www.squirrelmail.org"
depends=('php' 'perl' 'imap-server')
makedepends=('subversion')
conflicts=('squirrelmail')
provides=('squirrelmail=1.5.2')
source=("squirrelmail::svn+http://svn.code.sf.net/p/squirrelmail/code/trunk/${_svnmod}")
sha512sums=('SKIP')
backup=(srv/http/squirrelmail/.htaccess srv/http/squirrelmail/config/config.php)
install=${pkgname}.install
options=(!strip)

pkgver() {
	cd "$srcdir"/${_svnmod}
	local ver=$(svnversion)
	printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
	if [ -d ${_svnmod}-build ]; then
		rm -Rf ${_svnmod}-build
	fi
	svn --force export ${_svnmod} ${_svnmod}-build
}

package() {
	# install
	mkdir -p "${pkgdir}"/srv/http/squirrelmail
	cd "${pkgdir}"/srv/http/squirrelmail
	cp -a "${srcdir}"/squirrelmail-build/* .

	# customize config (data and attachments in /var/lib/squirrelmail)
	cd config
	cp -p config_default.php config.php
	sed -i 's|^$attachment_dir = $data_dir;|$attachment_dir = "/var/lib/squirrelmail/attachments";|' config.php
	sed -i 's|^$data_dir = "/var/local/squirrelmail/data";|$data_dir = "/var/lib/squirrelmail/data";|' config.php

	# create data and attachments directories, set ownership/permissions
	# ideally we would set attachments differently to root:-1 with 0730, but
	# I don't know how to get chgrp to take "-1" properly; perhaps someday
	# I'll figure out how to make this work
	mkdir -p "${pkgdir}"/var/lib/squirrelmail/{data,attachments}
	chown -R http:http "${pkgdir}"/var/lib/squirrelmail/data
	chown -R http:http "${pkgdir}"/var/lib/squirrelmail/attachments
	chmod 0700 "${pkgdir}"/var/lib/squirrelmail/data
	chmod 0300 "${pkgdir}"/var/lib/squirrelmail/attachments

	# restrict access to squirrelmail by default
	echo "deny from all" >"${pkgdir}"/srv/http/squirrelmail/.htaccess
}
