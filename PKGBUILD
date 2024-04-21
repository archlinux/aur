# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: marcin mikołajczak <me@mkljczk.pl>

pkgname=tokodon-git
pkgver=24.02.2.r232.gd78745d
pkgrel=2
pkgdesc="Native Mastodon client"
arch=(x86_64)
url="https://invent.kde.org/network/tokodon"
license=(LGPL)
depends=(gcc-libs
         glibc
         kcolorscheme
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kirigami-addons
         kitemmodels
         knotifications
         kservice
         kwindowsystem
         mpvqt
         purpose
         qqc2-desktop-style
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-websockets
         qt6-webview
         qtkeychain-qt6)
makedepends=(extra-cmake-modules git)
checkdepends=(xorg-server-xvfb)
optdepends=("mesa-vdpau: solve Failed to open VDPAU backend libvdpau_radeonsi.so"
            "nvidia-utils: solve Cannot load libcuda.so.1")
conflicts=(tokodon)
provides=(tokodon)
source=(#"git+https://invent.kde.org/network/tokodon.git#branch=release/24.05"
        "git+https://invent.kde.org/network/tokodon.git")
sha256sums=('SKIP')

pkgver() {
  cd tokodon
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  local _tag=$(git tag | sort -rV | head -1)
  local _version="${_tag#v}"
  local _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  cmake -B build -S tokodon -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

check() {
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local'  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
