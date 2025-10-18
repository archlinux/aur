# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Mark Wagie
# Contributor: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=appimagelauncher
pkgver=3.0.0_beta_2
_pkgname=AppImageLauncher
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Helper for running and integrating AppImages'
#arch=(x86_64)
arch=(x86_64 aarch64)
url=https://github.com/TheAssassin/AppImageLauncher
license=(MIT)
depends=(
  cairo desktop-file-utils fuse2 hicolor-icon-theme lib32-glibc lib32-gcc-libs
  libbsd libxpm nlohmann-json patchelf qt5-base qt5-declarative shared-mime-info
  # Reported by namcap
  librsvg libarchive squashfuse) # libappimage xdg-utils
makedepends=(argagg boost cmake git gtest python qt5-tools xxd)
source=(
  "$pkgname-$pkgver.tag.gz::$url/archive/refs/tags/v$_pkgver.tar.gz"
  appimage-binfmt-remove.hook)
sha256sums=(
  '3cd3c2557c3d54b6d6085fc84a6fea279c3eff5bc6f315ef99bd216ff5ba4dd1'
  '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

prepare() {
  sed -i "s/COMMAND git/COMMAND true/" "$_pkgname-$_pkgver/cmake/versioning.cmake"
  # shellcheck disable=SC2016
  sed -i 's|${APPIMAGELAUNCHER_GIT_COMMIT}|release/tag|' "$_pkgname-$_pkgver/cmake/versioning.cmake"
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5 # For "make xdg-utils"

  #-DUSE_SYSTEM_BOOST=ON \
  #-DUSE_SYSTEM_GTEST=ON \
  #-DUSE_SYSTEM_LIBAPPIMAGE=ON \
  cmake -B build -S "$_pkgname-$_pkgver" \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCPR_FORCE_USE_SYSTEM_CURL=ON \
    -DFETCHCONTENT_QUIET=OFF \
    -DUSE_SYSTEM_SQUASHFUSE=ON \
    -Wno-dev
  ##make -C build libappimage libappimageupdate libappimageupdate-qt
  cmake --build build
  #make -C build
}

package() {
  #make DESTDIR="$pkgdir" -C build install
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 appimage-binfmt-remove.hook -t "$pkgdir/usr/share/libalpm/hooks"
  install -Dm644 "$_pkgname-$_pkgver/LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname"
}
