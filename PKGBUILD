# Maintainer: Maxime Morel <maxime@mmorel.eu>
# Co-Maintainer: dreieck

pkgname=opentrack-git
epoch=1
pkgver=2.3.13+r6207.20210425.0ddcf4eb
pkgrel=2
pkgdesc="An application dedicated to tracking user's head movements and relaying the information to games and flight simulation software"
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/opentrack/opentrack/"
license=('GPL3')
depends=(
  'opencv'
  'qt5-base'
)
optdepends=()
makedepends=(
  'cmake' 
  'git'
  'ninja'
  'wine'
  'xplane-sdk-devel'
)
provides=("opentrack=${pkgver}")
conflicts=('opentrack')
source=(
  "git+https://github.com/opentrack/opentrack.git"
  "opentrack.desktop"
)
sha256sums=(
  'SKIP'
  '40f856cae6f8651fbbc37666b9d5ef35c3aa2399cd28f8b89d411bfc1ad871e7'
)

pkgver() {
  cd "$srcdir/opentrack"
  _ver="$(git describe --tags | awk -F- '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 11
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd opentrack
  mkdir -p build
  cd build

  # fix path for xplane plugin
  sed -i 's/..\/opentrack-compat\/export.hpp/..\/compat\/export.hpp/' ../x-plane-plugin/plugin.c
  mkdir -p xplane_sdk/CHeaders
  ln -sf /usr/include/xplane_sdk/Wrappers xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/Widgets xplane_sdk/CHeaders/
  ln -sf /usr/include/xplane_sdk/XPLM xplane_sdk/CHeaders/
  cmake .. \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DSDK_XPLANE=xplane_sdk \
      -DSDK_WINE=ON \
      -DCMAKE_INSTALL_PREFIX=/usr

  ninja
}

package() {
  cd opentrack/build
  DESTDIR="$pkgdir" ninja install

  install -Dm644 $srcdir/opentrack.desktop $pkgdir/usr/share/applications/opentrack.desktop
}

