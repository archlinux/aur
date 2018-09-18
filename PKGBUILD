# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.12.0
pkgrel=2
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
sha512sums=('4aee877785f9ac080e4f8ee20f3643bc4f3ddbc568aca6c363a962f8c8f76b8db7dc113c8167092f0277d112346a85b9a7e7c3c3f227ed243aaba32c9092c924'
            'SKIP')
prepare() {
  cd "${srcdir}/$_pkgname-$pkgver"
  patch -Np1 -i ../$_patch
}
build() {
  cd "${srcdir}/$_pkgname-$pkgver"
  meson build --prefix=/usr \
        --libexecdir=/usr/lib \
        -Dtests=false \
        -Ddocumentation=false
  ninja -C build
}
package() {
  cd "${srcdir}/$_pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
  install -Dvm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
