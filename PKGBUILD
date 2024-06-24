# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.16.1
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
pkgdesc='GUI to monitor and manage Tailscale'
license=(GPL-3.0-only)
depends=(
  gcc-libs
  glibc
  hicolor-icon-theme
  kconfig
  kcoreaddons
  kguiaddons
  ki18n
  kirigami
  kirigami-addons
  knotifications
  qqc2-desktop-style
  qt6-base
  qt6-declarative
  qt6-svg
  tailscale
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  go
  nlohmann-json
)

# git tag is used by the cmake script to determine app version
source=(git+$url.git#tag=v$pkgver)
sha256sums=('723f441785feb409eff395dccb9695e6533a1d0c1d21b0e8acd4412b22023229')

prepare() {
  cd KTailctl/src/wrapper
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
  install -Dm755 build/bin/libktailctl_config.so -t "$pkgdir/usr/lib/"
}
