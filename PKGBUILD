# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Omar Vega Ramos <ovruni@gnu.org.pe>
# Contributor (Arch): SpepS <dreamspepser at yahoo dot it>
# Contributor (Arch): Ander <anderraso@gmail.com>

pkgname=gnuhealth
pkgver=3.0.5
pkgrel=1
pkgdesc="A Free Health and Hospital Information System"
arch=(any)
url=http://health.gnu.org/
license=(GPL3)
depends=(postgresql pygtk python2-caldav python2-dateutil python2-ldap python2-pillow python2-pip python2-psycopg2 python2-pytz python2-pywebdav
         python2-qrcode python2-vobject "trytond>=4.2" "trytond-calendar>=4.2" "trytond-currency>=4.2" "trytond-product>=4.2" "trytond-stock-lot>=4.2"
         "trytond-stock-supply>=4.2")
source=(http://ftp.gnu.org/gnu/health/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=(cc7d96b30f0f8667040cf0230686b3fb86799f77655383152f2fb698ea0d969555c5eb1adedd47f476c16126bfe11199721ae0e752fd3d6db261505058bff94d
            SKIP)
validpgpkeys=(14C7FD1362749706D602FBE2EADA01E3E44B8011) # Luis Falcon (meanmicio at GNU) <falcon@gnu.org>

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # fix python2 problem
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' $(grep -rlI '/usr/bin/env python')
}

package() {
  cd $srcdir/$pkgname-$pkgver

  # put gnuhealth manual to man folder
    install -Dm644 health/man/$pkgname.1 \
      $pkgdir/usr/share/man/man1/$pkgname.1

  # build gnuhealth modules
    for module in $(ls -1 | grep '^health*'); do
      cd $srcdir/$pkgname-$pkgver/$module
      python2 setup.py install --root=$pkgdir
    done
}
