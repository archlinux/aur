# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=radiotray-ng
pkgname=${_pkgname}-git
_pkgver=0.2.9
_branch=v${_pkgver}-dev
epoch=1
pkgver=0.2.9dev+3+c98c0b5
pkgrel=1
pkgdesc="An Internet radio player for Linux"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ebruck/radiotray-ng"
license=('GPL')
depends=('boost-libs' 'curl' 'gst-plugins-good' 'jsoncpp' 'libappindicator-gtk3'
         'libbsd' 'libnotify' 'libxdg-basedir' 'glibmm' 'wxwidgets-gtk3')
makedepends=('cmake' 'boost' 'lsb-release' 'git')
optdepends=('python-lxml: Convert radiotray bookmarks to radiotray-ng format')
options=('!libtool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_release_commit=20a7904fa62dedc3c5880afd84d91030dd26d92d
source=("${_pkgname}::git+https://github.com/ebruck/radiotray-ng#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf '%s+%s+%s' \
         "$( sed 's:-::;s:^v::' <<< ${_branch} )" \
         "$(( "$(git rev-list --count HEAD) - $( git rev-list --count ${_release_commit} )" ))" \
         "$(git describe --always)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's:-Werror::' CMakeLists.txt
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
