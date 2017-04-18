# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=etraxis
_pkgname=etraxis-obsolete-etraxis
pkgver=3.9.0
pkgrel=1
pkgdesc="web-based bug tracking system written on PHP. Includes fully custom templates, advanced filters, LDAP support, email notifications, subscriptions, reminders, flexible permissions management and graphical project metrics"
arch=(any)
url="https://www.etraxis.com/"
license=('GPL')
depends=('php>=5.1' 'php-gd' 'php-xsl')
optdepends=('php-pgsql: for postgresql database support' 'php-ldap: for ldap authentication')
install="$pkgname.install"
backup=("srv/http/$pkgname/config.php")
source=("https://github.com/etraxis/etraxis-obsolete/archive/$pkgname-$pkgver.tar.gz")
md5sums=('09d9949a57a1272f0cf42bacc081f315')

package() {
  _INST_DIR="srv/http/$pkgname"
  _SHARE_DIR="usr/share/$pkgname"
  
  # Install webroot files
	install -dm755 $pkgdir/$_INST_DIR
	cp -r $srcdir/$_pkgname-$pkgver/src/* $pkgdir/$_INST_DIR
	
  # Install SQL schema files
  install -dm755 $pkgdir/$_SHARE_DIR
	cp -r $srcdir/$_pkgname-$pkgver/tools/sql $pkgdir/$_SHARE_DIR/

  # Fix our configuration file
  sed -i \
    -e "s|/usr/local/apache/htdocs/etraxis|/$_INST_DIR|g" \
    -e "s|/usr/local/etraxis/bins/|/$_INST_DIR/attachments|g" \
    $pkgdir/$_INST_DIR/config.php
  install -dm755 $pkgdir/$_INST_DIR/attachments
	
  # Set correct permissions
  chown -R 33:33 $pkgdir/$_INST_DIR
  chmod -R u=rwX,go=rX $pkgdir/$_INST_DIR
}

# vim:set ts=2 sw=2 et:
