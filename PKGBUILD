pkgname='brite-git'
_pkgname='BRITE'
pkgver=r21.7bcc244
pkgrel=1
pkgdesc="Boston University Representative Internet Topology Generator."
arch=('x86_64')
url="https://gitlab.com/nsnam/BRITE"
license=('GPL-2.0-only')
conflicts=('brite')
provides=('brite')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
source=("git+${url}.git"
        "remove_inline.patch")
sha256sums=('SKIP'
            'e870dd4a18b06a6732bb8b362343f91fdb486881be31f796b91e5c29a6688199')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd ${_pkgname}
    git apply ../remove_inline.patch
}

build() {
  local cmake_options=(
    -B build
    -S ${_pkgname}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_INCLUDEDIR=include/brite
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

