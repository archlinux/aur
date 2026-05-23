# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_pkgname='xembed-sni-proxy-standalone'
pkgname="${_pkgname}-git"
pkgver=r3.c3afbd4
pkgrel=1
pkgdesc='Standalone version of xembed-sni-proxy extracted from plasma-workspace '
arch=('x86_64')
url='https://github.com/BLumia/xembed-sni-proxy'
# Upstream repository does not include LICENSE file. This is license is implied from the source.
license=('LGPL-2.1-or-later')
depends=('qt6-base' 'kwindowsystem' 'libxtst' 'libstdc++' 'glibc' 'xcb-util-image' 'xcb-util' 'libxcb' 'libgcc')
makedepends=('git' 'cmake' 'extra-cmake-modules')
conflicts=('xembedsniproxy')
_pkgsrc="${pkgname}"
source=("${_pkgsrc}::git+${url}.git"
  '0001-cmake.patch')
sha256sums=('SKIP'
            '5022eea97a03e4b3e54954d544b9a5ea9d6eb46cf7f8df4340488161227dac94')

pkgver() {
  cd "${_pkgsrc}"
  (
    set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 <"${srcdir}/0001-cmake.patch"
}

build() {
  local cmake_options=(
    -B build
    -S "${srcdir}/${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D KDE_INSTALL_SYSCONFDIR=/etc
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
