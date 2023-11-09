# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.13.0
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
  kirigami-addons5
  kirigami2
  knotifications5
  nlohmann-json
  qt5-base
  qt5-declarative
  qt5-quickcontrols2
  qt5-svg
  tailscale
)
makedepends=(cmake extra-cmake-modules)

# git tag is used by the cmake script to determine app version
source=(git+$url.git#tag=v$pkgver 0001-use-system-packages.patch)
sha256sums=('SKIP'
            '4a81c8d6a4ffb52f592e942e45307facad6f0bb82da65998942a2578792b043c')

prepare() {
  cd KTailctl
  patch -p1 <"$srcdir"/0001-use-system-packages.patch

  cd tailwrap
  go mod vendor
}

build() {
  cmake -B build -S KTailctl \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
