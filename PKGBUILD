# $Id: PKGBUILD 140402 2011-10-12 20:25:08Z eric $
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=squirrelmail
pkgver=1.4.22
pkgrel=1
pkgdesc="Webmail for Nuts!"
arch=('any')
license=('GPL')
url="http://www.squirrelmail.org"
depends=('php' 'perl' 'imap-server')
backup=(srv/http/squirrelmail/.htaccess srv/http/squirrelmail/config/config.php)
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-webmail-$pkgver.tar.bz2{,.sig})
md5sums=('494016b82762e57dca009fd9cc77ac2e'
         'eddabb7071e008c41308d957ff8c3e32')

package() {
  # install
  mkdir -p "$pkgdir"/srv/http/squirrelmail
  cd "$pkgdir"/srv/http/squirrelmail
  cp -a "$srcdir"/squirrelmail-webmail-$pkgver/* .

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

# vim: ts=2 sw=2 et ft=sh
