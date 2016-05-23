# Maintainer: Peter Hoeg <first name at last name dot com>

pkgname=glpi
pkgver=0.90.3
pkgrel=1
pkgdesc="GLPI Inventory Management"
arch=('any')
url='http://www.glpi-project.org'
source=("https://github.com/glpi-project/glpi/releases/download/${pkgver}/glpi-${pkgver}.tar.gz"
        'glpi.install'
        'glpi.service'
        'glpi-cron.service'
        'glpi-cron.timer')
license=('GPL')
options=(!strip)
depends=(mysql php)
backup=(etc/glpi/config_db.php)
optdepends=('nginx: a more performant webserver'
            'apache: a more performant webserver')
sha256sums=('15d1cdef40b425d5e6af67e65855298ba9b25af714f44fc3a4f5fb8e646f1227'
            '6ba1f37a68179b04dfeff44b67c0806a513c1548ebd2cf47232e5f6026f76296'
            'c5ca6a8d1bcc73c71348d5f8a4c3de0fd023c346d1c2bf02c9dd627bcda9bfe8'
            '6b515c1c8cc44ef703fe01e53b64d6aea56ed1c833b3553233482437478d4e77'
            'eea9489db1fa8f4762957eb6299dd22ca43c25f9dc62628c973a53cbcfdbab1f')
install=glpi.install

package() {
  cd $srcdir/glpi || exit

  _base=$pkgdir/usr/share/webapps/glpi

  mkdir -p \
        $pkgdir/usr/lib/systemd/system \
        $pkgdir/etc \
        $pkgdir/var/lib \
        $pkgdir/usr/share/doc/glpi \
        $_base

  cp $srcdir/glpi*.{service,timer} $pkgdir/usr/lib/systemd/system

  mv *.txt $pkgdir/usr/share/doc/glpi
  cp -r * $_base

  mv $_base/config $pkgdir/etc/glpi
  ln -s /etc/glpi $_base/config

  mv $_base/files $pkgdir/var/lib/glpi
  ln -s /var/lib/glpi $_base/files

  find $pkgdir -name remove.txt -delete

  find $pkgdir -type d | xargs chmod 755
  find $pkgdir -type f | xargs chmod 644

  find $_base/scripts -name '*.sh' | xargs chmod 755
  find $_base/scripts -name '*.sh' | xargs sed -i 's/YOURSERVER/localhost:8080/'
}
