# $Id: PKGBUILD 228304 2015-01-01 02:32:08Z eric $
# Original Package: Eric Bélanger <eric@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz0@gmail.com>
pkgname=lib32-lm_sensors
pkgver=3.3.5
pkgrel=1
pkgdesc="Collection of user space tools for general SMBus access and hardware monitoring"
arch=('i686' 'x86_64')
url="http://www.lm-sensors.org/"
license=('GPL' 'LGPL')
depends=('perl' 'sysfsutils')
makedepends=('rrdtool')
optdepends=('rrdtool: for logging with sensord')
backup=('etc/sensors3.conf' 'etc/healthd.conf' 'etc/conf.d/sensord')
source=(http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${pkgver}.tar.bz2
	healthd healthd.conf healthd.service sensord.conf
        lm_sensors-fancontrol.patch)
sha1sums=('179989a52bae8f01ba8ed77e8a15af6ec653d89e'
          '1c91ae403d3cd02b6177ad1f1b2f2c3a7a3257f5'
          '1edd4d72ade22adfc128fb8d670e85c633fd1d18'
          'd72ec328e9303acef86342483b6f8537de6117d9'
          'f4b5f21fdb3b2a55aa353afa1603f953b207b73b'
          'b0bc977348610d6a008d75a43f65800251c4c9f7')

prepare() {
  cd lm_sensors-${pkgver}
  sed -i 's|/etc/sysconfig|/etc/conf.d|' prog/{detect/sensors-detect,init/{sensord,lm_sensors}.service}
  sed -i 's/EnvironmentFile=/EnvironmentFile=-/' prog/init/lm_sensors.service
  patch -p0 -i "${srcdir}/lm_sensors-fancontrol.patch"
  sed -i 's/CC := gcc/CC := gcc -m32/' Makefile
}

build() {
  cd lm_sensors-${pkgver}
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  make PREFIX=/usr
}

package() {
  cd lm_sensors-${pkgver}
  #make PROG_EXTRA=sensord BUILD_STATIC_LIB=0 \
  #  PREFIX=/usr SBINDIR=/usr/bin MANDIR=/usr/share/man DESTDIR="${pkgdir}" install
  
  make PREFIX=/usr DESTDIR="${pkgdir}" install 
  
  rm "${pkgdir}/etc/" -R
  
  rm ${pkgdir}/usr/bin/ -R
  rm ${pkgdir}/usr/include/ -R
  mv ${pkgdir}/usr/lib/ ${pkgdir}/usr/lib32/
  rm ${pkgdir}/usr/sbin -R
  rm ${pkgdir}/usr/man -R

  #install -D -m755 "${srcdir}/healthd" "${pkgdir}/usr/bin/healthd"

  #install -D -m644 "${srcdir}/healthd.conf" "${pkgdir}/etc/healthd.conf"
  #install -D -m644 "${srcdir}/sensord.conf" "${pkgdir}/etc/conf.d/sensord"
 
  #install -D -m644 "${srcdir}/healthd.service" "${pkgdir}/usr/lib/systemd/system/healthd.service"
  #install -D -m644 prog/init/*.service "${pkgdir}/usr/lib/systemd/system/"
}
