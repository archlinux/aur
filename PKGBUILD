# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.12.2
pkgrel=1
pkgdesc='scroll patch, discrete deltay multiplier'
arch=(i686 x86_64)
url='http://freedesktop.org/wiki/Software/libinput/'
provides=($_pkgname=$pkgver)
license=('MIT')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
conflicts=($_pkgname)
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz
        $_patch)
sha512sums=('f7122a1d18dd2d0072a34fd9897ebe25a065100b3754052d7ec133bddb56d5c2a5a94950cfc8366ef5d117180c28b3ff99b1a62f3ab95df5ac22f86721fbdc67'
            'SKIP')
prepare() {
  cd "${srcdir}/$_pkgname-$pkgver"
  patch -Np1 -i ../$_patch
}
build() {
  cd "${srcdir}/$_pkgname-$pkgver"
  meson build --prefix=/usr \
        --libexecdir=/usr/lib \
        -Dudev-dir=/usr/lib/udev \
        -Dtests=false \
        -Ddocumentation=false
  ninja -C build
}
package() {
  cd "${srcdir}/$_pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
  install -Dvm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
