# Maintainer: bilabila <bilabila@qq.com>
_pkgname=libinput
_patch=multiplier.patch
pkgname=$_pkgname-multiplier
pkgver=1.12.0
pkgrel=1
pkgdesc='scroll patch, discrete deltay multiplier'
arch=(i686 x86_64)
url='http://freedesktop.org/wiki/Software/libinput/'
provides=($_pkgname=$pkgver)
license=('MIT')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('meson' 'doxygen' 'graphviz' 'gtk3' 'python-recommonmark')
conflicts=($_pkgname)
source=(https://gitlab.freedesktop.org/$_pkgname/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz
        $_patch)
md5sums=(5863fb1a6ed5131b2dd8c3bffe43c644
         71b3ecaf21c5ec18e0b82ff341da3fc7)
sha1sums=(b773b0201c502f1f49b07769e396e13f7ae380dd
          155b915b68867fe9ef610c47a3d79d5f1490ecb1)
prepare() {
  cd "${srcdir}/$_pkgname-$pkgver"
  patch -p1 -i ../$_patch
}
build() {
  cd "${srcdir}/$_pkgname-$pkgver"
  meson build --prefix=/usr \
        --buildtype=release \
        -Dtests=false
        #--libexecdir=/usr/lib \
  ninja -C build
}
package() {
  cd "${srcdir}/$_pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
