# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=letos
pkgname=(
  letos
  letos-plugins
)
pkgver=4.0.2
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
b2sums=('3a63022fe1c852046cf58d4cb4a21b96867115fee5ee18d6a242ff401d2c3eb6af8ecfbd5e6d76fb01b9537ef854427b60075089a3a3136ebe21bf71218169f7')

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
