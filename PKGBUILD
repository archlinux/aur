# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Julien Savard <juju@juju2143.ca>
# Contributor: John Cesarz <commandz@commandblockguy.xyz>
# Contributor: Nathaniel van Diepen <eeems@eeems.codes>

pkgname=ticemu
pkgver=2.0
url='https://ce-programming.github.io/CEmu/'
pkgrel=3
makedepends=('git' 'cmake' 'ninja')
depends=('qt6-base' 'libarchive' 'libusb' 'libgcc' 'libstdc++' 'glibc')
pkgdesc='Third-party TI-84 Plus CE / TI-83 Premium CE emulator, focused on developer features'
license=('GPL-3.0-or-later')
arch=('x86_64')
source=("$pkgname::git+https://github.com/CE-Programming/CEmu.git#tag=v${pkgver}"
	"git+https://github.com/CE-Programming/zdis.git"
	"git+https://github.com/adriweb/tivars_lib_cpp.git"
	"mainwindow.patch::https://github.com/CE-Programming/CEmu/commit/3e43e0358846f18d9246e9252d1fe0966aa26a14.diff")
md5sums=('0c79f7bc6992b0ae4403486d16c7b0f6'
         'SKIP'
         'SKIP'
         'd970f442be0d7ebe4a130cf3d204f64d')
prepare(){
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.core/debug/zdis.url "$srcdir/zdis"
  git config submodule.gui/qt/tivars_lib_cpp.url "$srcdir/tivars_lib_cpp"
  git -c protocol.file.allow=always submodule update
  sed -i 's/FILENAME_VARIABLE deploy_script/OUTPUT_SCRIPT deploy_script/g' gui/qt/CMakeLists.txt
  patch -Np1 < "$srcdir/mainwindow.patch"
}

build() {
  cd "$srcdir"
  cmake -B build -S "$srcdir/$pkgname/gui/qt" \
  -GNinja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
  -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
  -DCMAKE_SKIP_RPATH=ON \
  -DCMAKE_SKIP_INSTALL_RPATH=ON \
  -DSHORT_VERSION="v${pkgver}" \
  -DIS_OFFICIAL_RELEASE_VERSION=ON

  cmake --build build

}
package() {
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/linux/cemu.desktop" "$pkgdir/usr/share/applications/CEmu.desktop"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/icons/linux/cemu-512x512.png" "$pkgdir/usr/share/pixmaps/CEmu.png"
  install -Dm644 "$srcdir/$pkgname/gui/qt/resources/linux/cemu.xml" "$pkgdir/usr/share/mime/packages/cemu.xml"
  install -Dm755 "$srcdir/build/CEmu" "$pkgdir/usr/bin/CEmu"

  sed -i 's/Icon=cemu/Icon=CEmu/g' "$pkgdir/usr/share/applications/CEmu.desktop"
}
