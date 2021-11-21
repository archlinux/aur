# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.19.2
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
sha512sums=(fc5244dc90ceb710f7b5bb76a3cafc7dd5a8d5fa05c51122412615bfc3a99435d6a1017b79c3ce73561139fc2f5959acaf16cb9500796ea2f3eb6cb95d1a1acb
            aa22c523072e13c9a76153a89443d51fd16def29ccdc53aea142e278ad02820f2f7fef5b40e94fa2ed4c2062e237f70a9847d975e9100c998b39451f7267c3cc)
prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -Np1 -i ../$_patch
}
build() {
  arch-meson $_pkgname-$pkgver build \
        -D b_lto=false \
        -D udev-dir=/usr/lib/udev \
        -D tests=false \
        -D documentation=false
  meson compile -C build
}
package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dvm644 $_pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
