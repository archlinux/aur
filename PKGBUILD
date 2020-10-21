# Maintainer: Katoitalia

pkgname=obs-transition-matrix-git
pkgver=master.r0.g15f096e
pkgrel=1
arch=(x86_64)
pkgdesc="Expands the basic OBS custom transition support to a scene to scene basis."
url="https://github.com/admshao/obs-transition-matrix"
license=('GPL2')
depends=("obs-studio" "qt5-base")
makedepends=("cmake" "git")
provides=("obs-transition-matrix")
source=("$pkgname::git+https://github.com/admshao/obs-transition-matrix.git"
        "git+https://github.com/obsproject/obs-studio.git")
md5sums=("SKIP" "SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags --all | sed -r "s/([^-]*-g)/r\1/;s/-/./g" | awk 'BEGIN { FS = "/"} {print $2}'
}

package() {
  cd $pkgname

  mkdir -p build; cd build

  cmake \
     -DLIBOBS_INCLUDE_DIR="$srcdir"/obs-studio/libobs \
     -DLIBOBS_LIB=/usr/lib/libobs.so \
     -DOBS_FRONTEND_LIB=/usr/lib/libobs-frontend-api.so \
     -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr ..

  make -j$(($(nproc)+1))
  make install
}
