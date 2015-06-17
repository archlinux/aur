# Maintainer: Pavol Hluchy (Lopo) <lopoATlosysDOTeu>
# based on original squirrelmail package by darose

pkgname=squirrelmail-dev-svn
pkgver=14499
pkgrel=1
pkgdesc='Webmail for Nuts! (Development version Subversion source)'
arch=('any')
license=('GPL')
url="http://www.squirrelmail.org"
depends=('php' 'perl' 'imap-server')
makedepends=('subversion')
conflicts=('squirrelmail')
provides=('squirrelmail=1.5.2')
source=()
md5sums=()
backup=(srv/http/squirrelmail/.htaccess srv/http/squirrelmail/config/config.php)
install=$pkgname.install
options=(!strip)
_svntrunk='http://squirrelmail.svn.sourceforge.net/svnroot/squirrelmail/trunk/squirrelmail'
_svnmod='squirrelmail'

package() {
	cd $srcdir

	if [ $NOEXTRACT -eq 0 ]; then
		msg "Connecting to ${_svntrunk} SVN server...."
		if [ -d $_svnmod/.svn ]; then
			(cd ${_svnmod} && svn up -r ${pkgver})
		else
			svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
		fi
		msg "SVN checkout done or server timeout"
	fi
	if [ -d ${_svnmod}-build ]; then
		rm -Rf ${_svnmod}-build
	fi
	svn --force export ${_svnmod} ${_svnmod}-build
	msg "Starting make ${pkgname} ..."

	# install
	mkdir -p "$pkgdir"/srv/http/squirrelmail
	cd "$pkgdir"/srv/http/squirrelmail
	cp -a "$srcdir"/${_svnmod}-build/* .

	# remove CVS dirs
	find "$pkgdir" -type d -name CVS -exec rm -rf {} \;

	# customize config (data and attachments in /var/lib/squirrelmail)
	cd config
	cp -p config_default.php config.php
	sed -i 's|^$attachment_dir = $data_dir;|$attachment_dir = "/var/lib/squirrelmail/attachments";|' config.php
	sed -i 's|^$data_dir = "/var/local/squirrelmail/data";|$data_dir = "/var/lib/squirrelmail/data";|' config.php

	# create data and attachments directories, set ownership/permissions
	# ideally we would set attachments differently to root:-1 with 0730, but
	# I don't know how to get chgrp to take "-1" properly; perhaps someday
	# I'll figure out how to make this work
	mkdir -p "$pkgdir"/var/lib/squirrelmail/{data,attachments}
	chown -R http:http "$pkgdir"/var/lib/squirrelmail/data
	chown -R http:http "$pkgdir"/var/lib/squirrelmail/attachments
	chmod 0700 "$pkgdir"/var/lib/squirrelmail/data
	chmod 0300 "$pkgdir"/var/lib/squirrelmail/attachments

	# restrict access to squirrelmail by default
	echo "deny from all" >"$pkgdir"/srv/http/squirrelmail/.htaccess
}
