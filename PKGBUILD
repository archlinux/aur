# Contributor: Piotr Rogoza <piotr.r.public at gmail dot com>
# Contributor: Austin Keller <austin.keller@smartsheet.com>
# Maintainer: tee < teeaur at duck dot com >

pkgbase=letos
pkgname=(
  letos
  letos-plugins
)
pkgver=4.0.4
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
b2sums=('ee8a6bcb858be8a2ab03ee80b333eeefea611d0423f4e5a5b053fde8ad7c09d9ee854b4c395094d9ff26f6246eedb048c2af4932da63705a2ff4b5da31ede48e')

build(){
  local _cmakeargs=(
    -DCMAKE_BUILD_TYPE=Release 
    -DCMAKE_INSTALL_PREFIX=/usr
    -DSYS_PLUGINS_DIR=/lib/letos/plugins
  )
  CXXFLAGS+=' -DPLUGINS_DIR=\"/lib/letos\"' # also works!
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
  # fix cmake installing to wrong location
  install -d "$pkgdir/usr/bin"
  mv "$pkgdir/usr/letos" "$pkgdir/usr/bin/"
  cd "letos-$pkgver"
  install -Dm644 Letos/letos/letos.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md ChangeLog.md -t "$pkgdir/usr/share/doc/$pkgname/"
  cd Letos/gui/img
  install -Dm644 letos.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/letos.svg"
  install -Dm644 letos_16.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/letos.png"
  install -Dm644 letos_48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/letos.png"
  install -Dm644 letos_256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/letos.png"
  # rm cmake's erroneously installed files
  rm -f "$pkgdir/usr"/{letos.desktop,letos.svg,letos_16.png,letos_48.png,letos_256.png}
}

package_letos-plugins(){
  pkgdesc='Official plugins for letos (formerly sqlitestudio)'
  depends=(letos python tcl)
  replaces=(sqlitestudio-plugins)
  cmake --install plugins --prefix="$pkgdir"/usr/lib/letos
}
# vim:set noet sts=0 sw=4 ts=4:
