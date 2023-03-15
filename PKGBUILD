# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Peter Hoeg <first name at last name dot com>
# Contributor: khvalera <khvalera[at]ukr[dot]net>

pkgname=glpi
pkgver=10.0.6
pkgrel=2
pkgdesc="GLPI Inventory Management"
arch=('any')
url='https://www.glpi-project.org'
source=("https://github.com/glpi-project/glpi/releases/download/${pkgver}/glpi-${pkgver}.tgz"
        'httpd-glpi.conf'
        'glpi.install'
        'glpi.service'
        'glpi-cron.service'
        'glpi-cron.timer'
        'downstream.php'
        'local_define.php'
        'http://snuglinux.pp.ua/local_glpi/uk_UA.po.bz2')
license=('GPL')
options=(!strip)
depends=("mysql")
backup=("etc/httpd/conf/extra/httpd-glpi.conf"
        "etc/glpi/local_define.php")
optdepends=('nginx: a more performant webserver'
            'apache: a more performant webserver'
            'php74' 'php74-gd' 'php74-intl' 'php74-sodium' 'php74-apache'
            'php' 'php-gd' 'php-intl' 'php-sodium' 'php-apache'
            'libxml2' 'zlib' 'openssl')
makedepends=("gettext")
sha256sums=('d30d915a7cdc2f0e117a38e86b528f787a41e5ffdf9c3a5f9f4a1b8a70bf91ce'
            '32bd84daa949cfa1158f2c6cd8fa2593fd4bd3cc6392791b69ab24ca98eee0dd'
            '04e40235a4a6c7d1e0daaa91e630654e632073fd5fee33bb6befa7b6f3713e44'
            'c5ca6a8d1bcc73c71348d5f8a4c3de0fd023c346d1c2bf02c9dd627bcda9bfe8'
            '6b515c1c8cc44ef703fe01e53b64d6aea56ed1c833b3553233482437478d4e77'
            'eea9489db1fa8f4762957eb6299dd22ca43c25f9dc62628c973a53cbcfdbab1f'
            'f6ab611d8e8a4520323a6da6c469d9c30e7c713073d47aa8a2719bb8e81e5f7f'
            'ac778bd538e0f2cb3195e1e5794bd57e45850bb823f30df9a7625746048a2d3d'
            'f36ccd3ce2f45a9bfe068d236cc68632f47edad96817424ece0364e851928175')
install=glpi.install

package() {
  cd $srcdir/glpi || exit

  mkdir -p \
        $pkgdir/etc \
        $pkgdir/etc/httpd/conf/extra \
        $pkgdir/usr/share/doc/glpi \
        $pkgdir/usr/share/licenses/$pkgname \
        $pkgdir/usr/share/webapps/glpi \
        $pkgdir/var/lib \

  install -dm 775 $pkgdir/var/log/glpi
  install -Dm644 "${srcdir}"/httpd-glpi.conf $pkgdir/etc/httpd/conf/extra
  ln -s LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  mv *.md $pkgdir/usr/share/doc/glpi
  mv config $pkgdir/etc/glpi
  mv files $pkgdir/var/lib/glpi
  cp -r * $pkgdir/usr/share/webapps/glpi
  install -Dm644 "${srcdir}"/downstream.php   $pkgdir/usr/share/webapps/glpi/inc/downstream.php
  install -Dm644 "${srcdir}"/local_define.php $pkgdir/etc/glpi/local_define.php
  find $pkgdir -name remove.txt -delete
  chmod 775 $pkgdir/etc/glpi
  chmod 775 $pkgdir/usr/share/webapps/glpi/marketplace
  find $pkgdir/var/lib/glpi -type d -exec chmod 775 "{}" \;
  rmdir "$pkgdir"/var/lib/glpi/_log
  install -Dm644 "${srcdir}"/*.po $pkgdir/usr/share/webapps/glpi/locales/
  msgfmt $pkgdir/usr/share/webapps/glpi/locales/uk_UA.po -o $pkgdir/usr/share/webapps/glpi/locales/uk_UA.mo
}
