# Maintainer: tarball <bootctl@gmail.com>

pkgname=ktailctl
pkgver=0.22.0
pkgrel=1
arch=(x86_64 aarch64)
url='https://github.com/f-koehler/KTailctl'
pkgdesc='GUI to monitor and manage Tailscale'
license=(GPL-3.0-only)
depends=(
  glibc
  hicolor-icon-theme
  kconfig
  kcoreaddons
  kdbusaddons
  kguiaddons
  ki18n
  kiconthemes
  kirigami
  kirigami-addons
  knotifications
  kwindowsystem
  libgcc
  libstdc++
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
)

# use any of:
#   gpg --keyserver keyserver.ubuntu.com --search-keys me@fkoehler.org
#   gpg --recv-keys fingerprint_below
#   gpg --import keys/pgp/*.asc
validpgpkeys=(
  'C5DC80511469AD81C84E3564D55A35AFB2900A11' # Fabian Köhler <me@fkoehler.org>
)

# git tag is used by the cmake script to determine app version
source=(git+$url.git#tag=v$pkgver?signed)
sha256sums=('cec7b6cb239d1f5f0390b964f154246591d54328977b290db00a2b13fdd928c8')

prepare() {
  cd KTailctl/src/tailscale/wrapper
  go mod vendor
}

build() {
  cmake -B build -S KTailctl \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
