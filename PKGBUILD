# Maintainer: h8red  h8red at yandex dot ru
# Contributor: Mattia Dongili <Mattia Dongili>

pkgname=cpufreqd
pkgver=2.4.2
pkgrel=11
pkgdesc="A small daemon to adjust cpu speed (and indeed voltage)"
arch=('i686' 'x86_64')
url="http://kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html"
license=('GPL2')
depends=('lm_sensors' 'cpufrequtils')
makedepends=('autoconf')
backup=('etc/cpufreqd.conf')
options=('!libtool')
source=("http://deb.debian.org/debian/pool/main/c/cpufreqd/cpufreqd_2.4.2.orig.tar.bz2"
        'cpufreqd.service'
        '619913.patch')
md5sums=('038a3254044ead9944d9a04bcc94b5f4'
         '4213dced234d7700dd012d3f63349cd1'
         '4183ae46467f27f5815f151b136183f5')

build() {
  cd ${srcdir}


  cd ${pkgname}-${pkgver}

  patch -p1 < ${srcdir}/619913.patch
  autoreconf -i

  ./configure --prefix=/usr \
    --sysconfdir=/etc --sbindir=/usr/bin
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1

  install -Dm644 ${srcdir}/cpufreqd.service ${pkgdir}/usr/lib/systemd/system/cpufreqd.service || return 1
}
