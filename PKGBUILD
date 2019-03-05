# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.12.6
pkgrel=1
pkgdesc='scroll patch, discrete deltay multiplier'
arch=(x86_64)
url='http://freedesktop.org/wiki/Software/libinput/'
provides=($_pkgname=$pkgver)
license=('GPL')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
conflicts=($_pkgname)
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz
        $_patch)
sha512sums=('02ad90c77a0c8c27fd96ec34e1546c5f0947ced49bad386372c1ef7c41b3b2157c39020f0766f20aaf2ab3c97128567e169279bea21115ced39499dda325d2ef'
            '9564ccadac39632e09e574bee0910896bbc598d684fa0f3afa0414111b8064213290db9bf5b1106365a68555d11afd86e23fb8c957305448e6c4dd1df0743c93')
prepare() {
  cd "${srcdir}/$_pkgname-$pkgver"
  patch -Np1 -i ../$_patch
}
build() {
  arch-meson $_pkgname-$pkgver build \
        -Dudev-dir=/usr/lib/udev \
        -Dtests=false \
        -Ddocumentation=false
  ninja -C build
}
package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dvm644 $_pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
