# Maintainer: Paul Hentschel (hpmachining) <aur at hpminc dot com>
# Contributor: Justin R. St-Amant <jstamant24 at gmail dot  com>

pkgname=camotics
pkgver=1.3.0
pkgrel=3
pkgdesc="3-axis NC machining simulation software"
arch=('x86_64')
url="https://camotics.org/"
license=('GPL2')
depends=(
  'v8-r'
  'qt5-websockets'
  'cairo'
  'desktop-file-utils'
)
makedepends=(
  'scons'
  'python-six'
  'qt5-tools'
  'cbang'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/CauldronDevelopmentLLC/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
  "0001_python3.13.patch"
)
sha256sums=('d863781be2a5f4af8d9594e95cb6a752a67e034985dc522c7a95ddb4238150be'
            'ad6d67a8a452eb59967b1b7c269f3ac0bb9164363a44c2429254c524743cb3f0')

prepare() {
  cd "CAMotics-$pkgver"
  patch -p1 -i "../0001_python3.13.patch"
}

build() {
  cd "CAMotics-$pkgver"
  CBANG_HOME=/opt/cbang scons cxxstd="c++20" linkflags="$LDFLAGS"
}

package() {
  cd "CAMotics-$pkgver"
  CBANG_HOME=/opt/cbang scons cxxstd="c++20" install install_prefix="$pkgdir/usr"

  install -d "$pkgdir/usr/share/$pkgname"/tpl_lib
  cp -a tpl_lib/ "$pkgdir/usr/share/$pkgname"
  install -Dm644 -t  "$pkgdir"/usr/share/applications CAMotics.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps images/camotics.png
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md COPYING LICENSE

  # install examples and machines
  install -d "$pkgdir/usr/share/doc/$pkgname"/{examples,machines}
  cp -a {examples/,machines/} "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
