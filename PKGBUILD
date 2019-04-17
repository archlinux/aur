# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.13.1
pkgrel=2
pkgdesc='scroll patch, discrete deltay multiplier'
arch=(x86_64)
url=http://freedesktop.org/wiki/Software/libinput
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
license=(custom)
depends=(mtdev systemd libevdev libwacom)
makedepends=(gtk3 meson)
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz
        $_patch)
sha512sums=(a19deec802e704038df0901c103a82a3370f56e0299f4cc1b6aa84c1832a66fb638e6f9d0fa708b51df6c3b939cdc1271e4ff547c645c566be03dce0bc9ff7e0
            bf31c78c40b568f3a4de029c596c2cee05b6d9dd0ee174259aac34dd87ea84a858ef5fd2ffdd753075da54a310480a9e1ed511cc49ca5edec6769b517bff41f9)
prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
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
  install -Dvm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
