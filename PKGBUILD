# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Mark Wagie
# Contributor: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=appimagelauncher
pkgver=2.2.0
_pkgver=0f91801
pkgrel=9
pkgdesc='Helper for running and integrating AppImages'
#arch=(x86_64)
arch=(x86_64 aarch64)
url=https://github.com/TheAssassin/AppImageLauncher
license=(MIT)
depends=(cairo desktop-file-utils hicolor-icon-theme libappimage libbsd libxpm qt5-base shared-mime-info)
makedepends=(boost cmake git gtest python qt5-tools)
source=(
  "$pkgname-$pkgver-$_pkgver.tar.xz::$url/releases/download/v$pkgver/appimagelauncher-$_pkgver.source.tar.xz"
  appimage-binfmt-remove.hook)
sha256sums=(
  '2ef58ed3233912677522620bbb1162bedd41206a786d93cbd5e0ff682aed8a75'
  '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

# Workaround for newer GCCs
CFLAGS="$CFLAGS -Wno-implicit-function-declaration -Wno-incompatible-pointer-types"

prepare() {
  cd $pkgname-$_pkgver.source

  # Optional: avoid 'fatal' git messages for a cleaner build output
  sed -i 's/COMMAND git rev-parse --short HEAD/COMMAND echo 0/' lib/AppImageUpdate/{CMakeLists.txt,lib/zsync2/CMakeLists.txt}
}

build() {
  cd $pkgname-$_pkgver.source

  #-DCPR_FORCE_USE_SYSTEM_CURL=ON
  #-DUSE_SYSTEM_BOOST=ON
  cmake . \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DUSE_SYSTEM_GTEST=ON \
    -DUSE_SYSTEM_LIBAPPIMAGE=ON \
    -Wno-dev

  make libappimageupdate{,-qt}
  cmake .

  make
}

package() {
  install -Dm644 appimage-binfmt-remove.hook -t "$pkgdir/usr/share/libalpm/hooks"

  cd $pkgname-$_pkgver.source
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
