 # Contributor: gamanakis

pkgname=dummynet
pkgver=20130607
pkgrel=9
pkgdesc="A live network emulation tool, originally designed for testing networking protocols, and since then used for a variety of applications including bandwidth management."
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('linux-headers')
depends=('linux')
install=dummynet.install
source=('git://github.com/gamanakis/dummynet')
md5sums=('SKIP')
url="http://info.iet.unipi.it/~luigi/dummynet/"

_kernmajor="$(pacman -Q linux | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-ARCH"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
  cd $srcdir/dummynet
  make
}

package() {
 cd $srcdir/dummynet/ipfw
 install -dm755 "$pkgdir/usr/bin/"
 install -m755 ipfw "$pkgdir/usr/bin/"
 cd $srcdir/dummynet/kipfw-mod
 install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
 install -m644 ipfw_mod.ko "$pkgdir/usr/lib/modules/$_extramodules/"

 find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

