# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=letos
pkgname=(
  letos
  letos-plugins
)
pkgver=4.0.3
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
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/pawelsalawa/letos/archive/$pkgver.tar.gz)
b2sums=('5338b478b022d753aad8ac946b178002db6a07d3ad257cfd0be1d380b2c2437276111064dc37dcb9e99d7359a4885754ff5f9d6c2dcefb5ba15289825ce54164')

build(){
  local _cmakeargs=(
    -DCMAKE_BUILD_TYPE=Release 
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSYS_PLUGINS_DIR=/lib/letos
  )
#  CXXFLAGS+=' -DPLUGINS_DIR=\"/lib/letos\"' # also works!
#  TODO: /lib/letos/styles
  msg2 "Making letos"
  cmake -Bbuild "letos-$pkgver"/Letos \
    -DBUILD_TESTING=OFF "${_cmakeargs[@]}"
  cmake --build build -j"$(nproc)"

  msg2 "Making letos plugins"
  cmake -Bplugins "letos-$pkgver"/Plugins "${_cmakeargs[@]}" \
    -DWITH_ALL_PLUGINS=ON -DWITH_DYNAMIC_PYTHON=ON
  cmake --build plugins -j"$(nproc)"
}

package_letos(){
  replaces=(sqlitestudio)
  cmake --install build --prefix="$pkgdir"/usr
  cd "letos-$pkgver"
  install -Dm644 Letos/letos/letos.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md ChangeLog.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cd "$pkgdir/usr/share/icons/hicolor"
  mv 16x16/apps/{letos_16.png,letos.png}
  mv 48x48/apps/{letos_48.png,letos.png}
  mv 256x256/apps/{letos_256.png,letos.png}
}

package_letos-plugins(){
  pkgdesc='Official plugins for letos (formerly sqlitestudio)'
  depends=(letos python tcl)
  replaces=(sqlitestudio-plugins)
  cmake --install plugins --prefix="$pkgdir"/usr
}
# vim:set noet sts=0 sw=4 ts=4:
