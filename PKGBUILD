# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.11.0
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
pkgdesc='GUI to monitor and manage Tailscale'
license=(GPL3)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig5
  kcoreaddons5
  kguiaddons5
  ki18n5
  kirigami-addons
  kirigami2
  knotifications5
  qt5-base
  qt5-declarative
  qt5-quickcontrols2
  qt5-svg
  tailscale
)
makedepends=(cmake extra-cmake-modules)

# git tag is used by the cmake script to determine app version
source=(git+$url.git#tag=v$pkgver 0001-force-system-kirigami-addons.patch)
sha256sums=('SKIP'
            'b56dca56831ce5263d9177778fd2f2efb52d44c40ce78ef91c6975d7678374ac')

prepare() {
  cd KTailctl
  patch -p1 <"$srcdir"/0001-force-system-kirigami-addons.patch
}

build() {
  cmake -B build -S KTailctl \
    -DDBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
