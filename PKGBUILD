# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=letos
pkgname=(
  letos
  letos-plugins
)
pkgver=4.0.1
pkgrel=1
pkgdesc='Database manager for SQLite (formerly sqlitestudio)'
arch=(x86_64)
url='https://letos.org'
license=('GPL-3.0-or-later AND LicenseRef-custom')
depends=(
  glibc
  qt6-base
  qt6-declarative
  qt6-tools
  hicolor-icon-theme
  sqlite
)
makedepends=(
  qt6-wayland
  python
  tcl
)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/pawelsalawa/letos/archive/${pkgver}.tar.gz)
b2sums=('247381c64d51622837b8e31aaf5547dc47e8021948a502230d71718bd7dd466140faf4f94ef749cf6a3dc99d0883bfe2c0e5f32367c9800dc6bbbc64df5e2ff5')

build(){
  msg2 "Making letos"
  cmake -Bbuild "letos-$pkgver"/Letos \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  msg2 "Making letos plugins"
  cmake -Bplugins "letos-$pkgver"/Plugins \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_ALL_PLUGINS=ON \
    -DWITH_DYNAMIC_PYTHON=ON
  cmake --build plugins
}

package_letos(){
  replaces=(sqlitestudio)
  cmake --install build --prefix="$pkgdir"/usr
  cd "letos-$pkgver"
  install -Dm644 Letos/letos/letos.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 ChangeLog.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_letos-plugins(){
  pkgdesc='Official plugins for letos (formerly sqlitestudio)'
  depends=(letos python tcl)
  replaces=(sqlitestudio-plugins)

  cmake --install plugins --prefix="$pkgdir"/usr
}
# vim:set noet sts=0 sw=4 ts=4:
