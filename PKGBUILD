# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.22.0
pkgrel=1
pkgdesc='libinput with a scroll patch'
arch=(x86_64)
url=http://freedesktop.org/wiki/Software/libinput
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
license=(custom)
depends=(mtdev systemd libevdev libwacom)
makedepends=(gtk4 meson wayland-protocols check)
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=(https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2
        $_patch)
sha512sums=(SKIP
            aa22c523072e13c9a76153a89443d51fd16def29ccdc53aea142e278ad02820f2f7fef5b40e94fa2ed4c2062e237f70a9847d975e9100c998b39451f7267c3cc)
prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -Np1 -i ../$_patch
}
build() {
  arch-meson $_pkgname-$pkgver build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false
  # Print config
  #meson configure build
  meson compile -C build
}
check() {
  meson test -C build --print-errorlogs
}
package() {
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
