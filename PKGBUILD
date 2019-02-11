# Maintainer: Paul Hentschel (hpmachining) <aur at hpminc dot com>
# Contributor: Justin R. St-Amant <jstamant24 at gmail dot  com>

pkgname=camotics
pkgver=1.2.0
pkgrel=1
pkgdesc="3-axis NC machining simulation software"
arch=('x86_64')
url="https://camotics.org/"
license=('GPL2')
depends=(
  'v8-3.14'
  'qt5-websockets'
  'cairo'
  'desktop-file-utils'
)
makedepends=(
  'scons'
  'python2-six'
  'qt5-tools'
  'cbang>=1.3.1'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/CauldronDevelopmentLLC/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f5203d2bbd32c4e347a8f79122e57b2deea68e6c5bd4f0be4087c4d62a31c8a4')

prepare() {
  cd "CAMotics-$pkgver"
  sed -i '24 a env.Append( LINKFLAGS = os.environ.get("LDFLAGS"))' SConstruct
}

build() {
  cd "CAMotics-$pkgver"
  CBANG_HOME=/opt/cbang scons
}

package() {
  cd "CAMotics-$pkgver"
  CBANG_HOME=/opt/cbang scons install install_prefix="$pkgdir/usr"

  install -d "$pkgdir/usr/share/$pkgname"/tpl_lib
  cp -a tpl_lib/ "$pkgdir/usr/share/$pkgname"
  install -Dm644 -t  "$pkgdir"/usr/share/applications CAMotics.desktop
  install -Dm644 -t "$pkgdir"/usr/share/pixmaps images/camotics.png
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md COPYING LICENSE

  # install examples and machines
  install -d "$pkgdir/usr/share/doc/$pkgname"/{examples,machines}
  cp -a examples/ "$pkgdir/usr/share/doc/$pkgname"
  cp -a machines/ "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
