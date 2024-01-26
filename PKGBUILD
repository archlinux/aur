# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.25.0
pkgrel=1
pkgdesc='libinput with scroll multiplier patch'
arch=(x86_64)
url=http://freedesktop.org/wiki/Software/libinput
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
license=(custom)
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
sha512sums=(b9dc3f3b5f34c82399dfb7ccb5f65d19a596c415f0198b39e3f360f5b87c42124a5355c8d9f6f42cc9ae2d4f9a90fe5da6260136fa83d278048392f93381a84b
            c6a2793e592c69829e542c91aafc2de42c0eddec1f2570a465590584164a64d3828507f2f1194ec48f0f5d85aa624054c101287e981b2a82a3a43d85b426aa94)
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
