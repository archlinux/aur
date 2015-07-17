 # Contributor: gamanakis

pkgname=dummynet
pkgver=20130607
pkgrel=7
pkgdesc="A live network emulation tool, originally designed for testing networking protocols, and since then used for a variety of applications including bandwidth management."
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('linux-headers')
depends=('linux')
install=dummynet.install
source=('http://info.iet.unipi.it/~luigi/doc/20130607-ipfw3.tgz'
	'4.1.patch')
md5sums=('004e65e6d545a89c4dcc3e741e287444'
         'e5bb97bd5fd49f6ed64a6bcfa3c2b63c')
url="http://info.iet.unipi.it/~luigi/dummynet/"

_kernmajor="$(pacman -Q linux | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-ARCH"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
  cd $srcdir/ipfw3-2012
  patch -p1 < $srcdir/4.1.patch
  make KERNELPATH=/usr/lib/modules/${_kernver}/build
}

package() {
 cd $srcdir/ipfw3-2012/ipfw
 install -dm755 "$pkgdir/usr/bin/"
 install -m755 ipfw "$pkgdir/usr/bin/"
 cd $srcdir/ipfw3-2012/kipfw-mod
 install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
 install -m644 ipfw_mod.ko "$pkgdir/usr/lib/modules/$_extramodules/"

 find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

