# Maintainer: spider-mario <spidermario@free.fr>
# Maintainer of `lv2`: Ray Rashif <schiv@archlinux.org>

pkgname=mingw-w64-lv2
pkgver=1.18.10
pkgrel=1
pkgdesc="Successor to the LADSPA audio plug-in standard (mingw-w64)"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('any')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-pkg-config' 'mingw-w64-gcc')
makedepends=('meson')
source=("http://lv2plug.in/spec/lv2-$pkgver.tar.xz")
sha512sums=('ab4bcf593f633b1ed16c0eb6aa4525458a00655ef9c87619bf85eaa966f8fd094a8e871b825f679e0d97923f8bbbf11841ff467022390ca2f1a5b5f66ccd5d1b')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd lv2-$pkgver
  for _arch in "${_architectures[@]}"; do
    meson setup -Dprefix=/usr/"$_arch" -D{plugins,tests,docs}=disabled build-"$_arch"
    meson compile -C build-"$_arch"
  done
}

package() {
  cd lv2-$pkgver
  for _arch in "${_architectures[@]}"; do
    meson install --destdir="$pkgdir" -C build-"$_arch"
  done

  rm -fr "$pkgdir"/usr/*/{bin,share}
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
