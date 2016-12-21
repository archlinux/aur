 # Contributor: gamanakis

pkgname=sch_cake
pkgver=r200.6484187
pkgver() {
	cd "sch_cake"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="The CAKE scheduler, bufferbloat.net"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-headers')
depends=('linux')
provides=('sch_cake')
install=sch_cake.install
source=('git+https://github.com/dtaht/sch_cake.git')
md5sums=('SKIP')
url="bufferbloat.net"

_kernmajor="$(pacman -Q linux | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-ARCH"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
  cd "${srcdir}/sch_cake"
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`
  gzip -f sch_cake.ko
}

package() {
 cd "${srcdir}/sch_cake"
 install -Dm755 sch_cake.ko.gz $pkgdir/usr/lib/modules/${_extramodules}/sch_cake.ko.gz
}
