# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.28.1
pkgrel=1
pkgdesc='libinput with scroll multiplier patch'
arch=(x86_64)
url=https://gitlab.freedesktop.org/libinput/libinput
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
license=(MIT)
depends=(mtdev systemd libevdev libwacom systemd-libs glibc)
makedepends=(gtk4 meson wayland-protocols check)
checkdepends=('python-pytest')
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure'
            'python-libevdev: libinput measure'
            'python-yaml: used by various tools')
source=(https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2
        $_patch)
sha256sums=(19e5337ec10fdf920c8d1f4ece63cd7d1c12279ee26e347e30e98e2942d9e1aa
  c8cdf1aa512d347e88e48cb8efdba1a8d56640d4048e3e8a5e6d14fa83e32fde)
prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -Np1 -i ../$_patch
}
build() {
  arch-meson $_pkgname-$pkgver build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false

  # Print config
  # meson configure build

  meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
