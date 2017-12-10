# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=radiotray-ng
pkgname=${_pkgname}-git
_pkgver=0.2.0
_branch=v${_pkgver}-dev
pkgver=0.2.0.r45.f80aa5f
pkgrel=1
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gstreamer' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm' 'wxgtk3')
makedepends=('cmake' 'boost' 'lsb-release' 'git')
optdepends=('python2-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
provides=("${_pkgname}=${pkgver%\.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/ebruck/radiotray-ng#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf '%s.r%s.%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Build fails when GMock is found, so don't check for it, don't compile tests
  sed -i 's:if (GMOCK_FOUND):if (GMOCK_FOUND AND ENABLE_GMOCK):' CMakeLists.txt
}

build() {
  cd "${srcdir}/${_pkgname}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir" install
}
