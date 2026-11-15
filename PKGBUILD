# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-git
pkgver=2024.2.0r16908.635b247f9
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
url="https://www.flightgear.org"
license=('GPL-2.0-or-later')
depends=('dbus'
         'glibc'
         'gsm'
         'hicolor-icon-theme'
         'libevent'
         'libgcc'
         'libglvnd'
         'libstdc++'
         'libx11'
         'openal'
         'flightgear-openscenegraph-git'
         'qt6-base'
         'qt6-declarative'
         'simgear-git'
         'speex'
         'speexdsp'
         'sqlite'
         'systemd-libs'
         'zlib')
makedepends=('boost' 'cmake' 'git' 'nlohmann-json' 'plib' 'qt6-svg' 'qt6-tools')
optdepends=('flightgear-data: Base data package'
            'osgxr: VR support')
provides=("flightgear=${pkgver}")
conflicts=('flightgear')
source=("flightgear::git+https://gitlab.com/flightgear/flightgear.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/flightgear
  printf "%sr%s.%s" \
    "$(tr -d '\n' < flightgear-version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/flightgear
  sed -i 's|Exec=\(.*\)|Exec=\1 --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop.in
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CHECK_FOR_QT5=OFF
    -D ENABLE_CCACHE=ON
    -D FG_DATA_DIR=/usr/share/flightgear/data
    -D SYSTEM_SQLITE=ON
    -S flightgear
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}/usr/appdir"
}
