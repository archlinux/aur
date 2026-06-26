# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=letos
pkgname=(
  letos
  letos-plugins
)
pkgver=4.0.0
pkgrel=1
pkgdesc='Database manager for SQLite formerly sqlitestudio'
arch=(x86_64)
url='https://letos.org'
license=('GPL-3.0-or-later AND LicenseRef-custom')
#replaces=(sqlitestudio)
depends=(
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
  ninja
)
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/pawelsalawa/letos/archive/${pkgver}.tar.gz)
b2sums=('6d043b6edbd2371c188e02fbe61f153e6265eed8ca12a2e40c56daa0ec735be9cf6c54739f6b520f1d6a1aa015badbe24280f344ec55fe57d6cde854bf85324f')

build(){
  msg2 "Making letos-main"
  cmake -Bbuild -S "letos-$pkgver"/Letos -GNinja \
      -DBUILD_TESTING=OFF \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  msg2 "Making letos-plugins"
  cmake -Bplugins -S "letos-$pkgver"/Plugins -GNinja \
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
  pkgdesc='Official plugins for sqlitestudio'
  depends=(letos python tcl)
  replaces=(sqlitestudio-plugins)

  cmake --install plugins --prefix="$pkgdir"/usr
}
# vim:set noet sts=0 sw=4 ts=4:
