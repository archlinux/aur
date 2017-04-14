# Maintainer: Archan Paul <paul.archan@gmail.com>
pkgname=gnuarmeclipse-qemu-git
pkgver=r50620.2c99a25f9e
pkgrel=1
pkgdesc="Fork, Cortex-M cores support, better integration with the GNU ARM QEMU Debugging plug-in"
arch=('i686' 'x86_64')
url="http://gnuarmeclipse.github.io/qemu/"
license=('GPL2' 'LGPL2.1')
provides=('gnuarmeclipse-qemu')
conflicts=('gnuarmeclipse-qemu-bin')
depends=('sdl2' 'sdl2_image')
makedepends=('git')
source=('gnuarmeclipse-qemu::git+https://github.com/gnuarmeclipse/qemu.git#branch=gnuarmeclipse')
md5sums=('SKIP')
	 
pkgver() {
  cd "$srcdir/gnuarmeclipse-qemu"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/gnuarmeclipse-qemu"
   git submodule update --init dtc
   #git clone -b gnuarmeclipse --depth 1 https://github.com/gnuarmeclipse/qemu.git gnuarmeclipse-qemu.git/
}

build() {
   cd "$srcdir/gnuarmeclipse-qemu"
   ./configure --python=/usr/bin/python2 --target-list=gnuarmeclipse-softmmu --prefix=/opt/gnuarmeclipse --disable-werror
   make
}

package() {
   cd "$srcdir/gnuarmeclipse-qemu"
   make DESTDIR="$pkgdir" install
   cp -a $srcdir/gnuarmeclipse-qemu/gnuarmeclipse/devices $pkgdir/opt/gnuarmeclipse/share/qemu/
   cp -a $srcdir/gnuarmeclipse-qemu/gnuarmeclipse/graphics $pkgdir/opt/gnuarmeclipse/share/qemu/
   #ln -s /opt/gnuarmeclipse/bin/qemu-system-gnuarmeclipse /usr/bin/qemu-system-gnuarmeclipse
}

