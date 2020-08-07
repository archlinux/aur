# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.16.0
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
sha512sums=(0c932a88f2a1d23ebef0d58c0cdbfb558e9e3d990fca15b21f5b9011bdd1bc2da81aad374fcdb8f4590f6ee2fc45e668e0583371ceb354437e585240e687aac6
            cae69ca6c92b7566e91ba073c34c0752464a878c1415306a7ec9a22a158989f4e3bb11eb5b0237bac947a6ee1765daabc8bb5af5f1e02bea2d98c6d9cfc01a4c)
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
