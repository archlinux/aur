# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=multipath-tools-git
pkgver=1389.90dd15d
pkgrel=1
pkgdesc="Tools to drive the Device Mapper multipathing driver (contains kpartx)"
url="http://christophe.varoqui.free.fr/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libaio' 'device-mapper')
makedepends=('git' 'setconf')
conflicts=('multipath-tools')
options=(!emptydirs)
source=("${pkgname}::git+http://git.opensvc.com/multipath-tools/.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${pkgname}
  sed -i 's|/sbin|/usr/bin|g' Makefile.inc
  sed -i 's|${prefix}/lib/udev|${prefix}/usr/lib/udev|g' Makefile.inc
  sed -i 's|$(prefix)/lib/systemd/system|$(prefix)/usr/lib/systemd/system|g' Makefile.inc
  sed -i 's|/etc/udev/|/usr/lib/udev/|g' kpartx/Makefile
}

build() {
  cd ${pkgname}
  setconf Makefile.inc GZIP '/usr/bin/gzip -9 -c'
  make
}

package() {
  cd ${pkgname}
  make LIB="/usr/lib" DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  cd "${pkgdir}"/usr/lib
  rm libmpathpersist.so
  ln -s libmpathpersist.so.0 libmpathpersist.so
}
