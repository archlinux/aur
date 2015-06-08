# Maintainer: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: Timothy Redaelli <timothy dot redaelli at gmail dot com>
# Contributor: DonVla <donvla at users dot sourceforge dot net>

pkgname=i2c-tools-svn
_pkgname=i2c-tools
pkgver=r6284
pkgrel=1
pkgdesc="Heterogeneous set of I2C tools for Linux that used to be part of lm-sensors."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.lm-sensors.org/wiki/I2CTools"
license=('GPL')
provides=('i2c-tools')
conflicts=('i2c-tools')
makedepends=('subversion')
optdepends=('read-edid: for decode-edid script'
            'python2-smbus: python2 bindings'
            'python-smbus: python3 bindings')
source=('i2c-tools-svn::svn+http://lm-sensors.org/svn/i2c-tools/trunk')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${pkgname}"
  make clean
  make
  make -C eepromer LDLIBS="-L../lib" LDFLAGS="-li2c"
}

package() {
  cd "${srcdir}/${pkgname}"
  make prefix="${pkgdir}/usr" sbindir="$pkgdir/usr/bin" install
  install -Dm755 eepromer/eeprog eepromer/eeprom eepromer/eepromer "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
