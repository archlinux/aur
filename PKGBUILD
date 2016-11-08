# Maintainer: h8red  h8red at yandex dot ru
# Contributor: Blaž Tomažič <blaz.tomazic@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=cpufreqd
pkgver=2.4.2
pkgrel=10
pkgdesc="A small daemon to adjust cpu speed (and indeed voltage)"
arch=('i686' 'x86_64')
url="http://www.linux.it/~malattia/wiki/index.php/Cpufreqd"
license=('GPL2')
depends=('cpupower' 'lm_sensors')
makedepends=('autoconf')
backup=('etc/cpufreqd.conf')
options=('!libtool')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'cpufreqd'
        'cpufreqd.service'
        'cpufreqd_acpi_battery.c.patch'
        'cpupower.patch')
md5sums=('2ca80a77849c9a69b81e27c1843c97f5'
         '4d0fafbdb5f1b7313fdeb6f1250ef34f'
         '4213dced234d7700dd012d3f63349cd1'
         'd0df76dce1bc6cc021b199f820b748b9'
         '7debc75713aff93e0545b80821099810')

build() {
  cd ${srcdir}


  cd ${pkgname}-${pkgver}

  #patch acpi
  patch -p0 < ${srcdir}/cpufreqd_acpi_battery.c.patch

  #patch for cpupower support
  patch -p0 < ${srcdir}/cpupower.patch
  autoreconf -i

  ./configure --prefix=/usr \
    --sysconfdir=/etc --sbindir=/usr/bin
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1

  install -Dm755 ${srcdir}/cpufreqd ${pkgdir}/etc/rc.d/cpufreqd || return 1
  install -Dm644 ${srcdir}/cpufreqd.service ${pkgdir}/usr/lib/systemd/system/cpufreqd.service || return 1
}
