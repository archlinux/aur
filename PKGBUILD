# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=roundcubemail-beta
pkgver=1.2
pkgrel=1
pkgdesc="A PHP web-based mail client"
arch=('any')
url="http://www.roundcube.net"
license=('GPL')
depends=('php' 'php-pear' 'pear-net-idna2' 'pear-mail-mime' 'pear-net-smtp'
	 'pear-auth-sasl' 'pear-mail-mime-decode' 'pear-net-sieve')
optdepends=('python2')
backup=('etc/webapps/roundcubemail/.htaccess'
	'etc/webapps/roundcubemail/apache.conf')
install=roundcubemail.install
options=('!strip' 'emptydirs')
source=("http://downloads.sourceforge.net/project/roundcubemail/roundcubemail-beta/1.2-beta/roundcubemail-1.2-beta-complete.tar.gz"
	apache.conf)
conflicts=('roundcubemail')
sha512sums=('f1e471143842453acb99fcbbf2ce054eea8a744bd43ab0a7bcc3bae5cb6a363005c3679f05b8bf52b7337e3b7f7107b1c0120f85f4edd9f3b9b8fd50a150bf8d'
         '0e80317ae6f040386b0980d0764bc8a9aa5f7cbf028a210a896763cb7a7fea6d91600eda588922a0eb6d519f2ec1e0a2f723bd7ab554c8b1ad4af49a95101f6e')

prepare() {
  cd ${srcdir}/roundcubemail-${pkgver/rc/-rc}-beta
  sed -i \
    -e "s|RCUBE_INSTALL_PATH . 'temp.*|'/var/cache/roundcubemail';|" \
    -e "s|RCUBE_INSTALL_PATH . 'logs.*|'/var/log/roundcubemail';|" \
    config/defaults.inc.php \
    program/lib/Roundcube/rcube_config.php
}

package() {
  mkdir -p ${pkgdir}/etc/webapps/roundcubemail
  mkdir -p ${pkgdir}/usr/share/webapps
  mkdir -p ${pkgdir}/var/log
  cd ${pkgdir}/usr/share/webapps
  cp -ra ${srcdir}/roundcubemail-${pkgver/rc/-rc}-beta roundcubemail
  cd roundcubemail

  mv .htaccess $pkgdir/etc/webapps/roundcubemail/
  ln -s /etc/webapps/roundcubemail/.htaccess .htaccess

  mv config $pkgdir/etc/webapps/roundcubemail/
  ln -s /etc/webapps/roundcubemail/config config

  install -dm0750 $pkgdir/var/{log,cache}/roundcubemail
  install -Dm0644 $srcdir/apache.conf $pkgdir/etc/webapps/roundcubemail/apache.conf

#  install -dm0755 $pkgdir/etc/php/conf.d/
#  cat <<'EOF' >$pkgdir/etc/php/conf.d/$pkgname.ini
#open_basedir = ${open_basedir}:/etc/webapps/roundcubemail:/usr/share/webapps/roundcubemail:/var/log/roundcubemail:/var/cache/roundcubemail
#EOF

  rm -rf temp logs
}
