# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.19.0
pkgrel=1
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
sha512sums=(daf42ce797f2b5aef8d6f7a5c0d967590581e6ac12c26fa6bde5fbc619d75319e39ca55d65d5347e554dd6a48b91f5fed4d3167eabef8ad1ebc43bc0c3e8e220
            cae69ca6c92b7566e91ba073c34c0752464a878c1415306a7ec9a22a158989f4e3bb11eb5b0237bac947a6ee1765daabc8bb5af5f1e02bea2d98c6d9cfc01a4c)
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
