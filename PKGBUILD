# Maintainer: HurricanePootis <hurricane@protonmail.com>
# Contributor: Julien Savard <juju@juju2143.ca>
# Contributor: Nathaniel van Diepen <eeems@eeems.codes>

pkgname=ticemu-git
pkgver=2.0.r204.g7c4aa0b9
pkgrel=1
url='https://ce-programming.github.io/CEmu/'
makedepends=('git' 'cmake' 'ninja' 'sol2')
depends=('qt6-base' 'libarchive' 'libusb' 'libgcc' 'libstdc++' 'lua54' 'glibc')
pkgdesc='Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features'
license=('GPL-3.0-or-later')
arch=('x86_64')
conflicts=("${pkgname::-4}")
provides=("${pkgname::-4}")
source=("$pkgname::git+https://github.com/CE-Programming/CEmu.git"
	"git+https://github.com/CE-Programming/zdis.git")
sha256sums=('SKIP'
            'SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags > /dev/null 2>&1;then
  git describe --tags --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/v//';
  else
  date +%Y%m%d;
  fi;
}
prepare(){
  cd "$srcdir/$pkgname"

  git submodule init
  git config submodule."core/debug/zdis".url $srcdir/zdis
  git -c protocol.file.allow=always submodule update

  sed -i 's/FILENAME_VARIABLE deploy_script/OUTPUT_SCRIPT deploy_script/g' gui/qt/CMakeLists.txt
}
build() {
  cd "$srcdir"

  cmake -B build -S "$srcdir/$pkgname/gui/qt" \
  -GNinja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG -I/usr/include/lua5.4" \
  -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG -I/usr/include/lua5.4" \
  -DCMAKE_SKIP_RPATH=ON \
  -DCMAKE_SKIP_INSTALL_RPATH=ON \
  -DSHORT_VERSION="v${pkgver}" \
  -DIS_OFFICIAL_RELEASE_VERSION=OFF \
  -DLUA_INCLUDE_DIR=/usr/include/lua54 \
  -DLUA_LIBRARY=/usr/lib/liblua5.4.so

  cmake --build build

}
package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/linux/cemu.desktop" "$pkgdir/usr/share/applications/CEmu.desktop"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/icons/linux/cemu-512x512.png" "$pkgdir/usr/share/pixmaps/CEmu.png"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/linux/cemu.xml" "$pkgdir/usr/share/mime/packages/cemu.xml"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/custom_fonts/TICELarge.ttf" "$pkgdir/usr/share/fonts/TTF/TICELarge.ttf"
  install -Dm755 "$srcdir/build/CEmu" "$pkgdir/usr/bin/CEmu"

  sed -i 's/Icon=cemu/Icon=CEmu/g' "$pkgdir/usr/share/applications/CEmu.desktop"
}
