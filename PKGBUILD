# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=radiotray-ng
pkgname=${_pkgname}-git
_pkgver=0.1.8
_branch=v${_pkgver}-dev
pkgver=0.1.8.r26.08e56c7
pkgrel=1
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gstreamer' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm')
makedepends=('cmake' 'boost' 'lsb-release' 'git')
optdepends=('python2-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
provides=("${_pkgname}=${pkgver%\.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/ebruck/radiotray-ng#branch=${_branch}"
        'remove_GMock_check.patch')
sha256sums=('SKIP'
            'c08b2a85ad7b83e70c9bfd843abaa2b13381736a9acf837eb68ca341b79e89e1')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf '%s.r%s.%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git describe --always)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Build fails when GMock is found, so don't check for it, don't compile tests
  patch -uNp2 -r- -i ../remove_GMock_check.patch
  # Fix for boost >= 1.65
  sed -i 's:find_package(Boost     REQUIRED [^)]*:& thread:' CMakeLists.txt
}

build() {
  cd "${srcdir}/${_pkgname}"
  [ -d build ] && rm -r build
  mkdir build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir" install
}
