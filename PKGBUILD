 # Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=lightly-qt6-git
pkgver=0.4.1.r73.g00ca2344
pkgrel=2
_branch=qt6
pkgdesc="A modern style for qt applications. (qt6 branch)"
url="https://github.com/boehs/Lightly"
license=('GPL-2.0')
depends=('kdecoration')
makedepends=('cmake' 'qt6ct' 'qt6-declarative' 'extra-cmake-modules' 'git')
arch=('x86_64')

source=("git+${url}.git#branch=${_branch}"
        "add-missing-files.patch")
sha256sums=('SKIP'
            '2553ff71310e265a9481c0afb9d50bbd1d9f66d47bd67675956199601c1a6501')

pkgver() {
  cd Lightly
  git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd Lightly

  git apply ../add-missing-files.patch
}

build() {
  local _cmake_options=(
    -B build
    -S "Lightly"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
    -DBUILD_TESTING=OFF
  )

  cmake "${_cmake_options[@]}"

  make -C build/kdecoration/config/

  cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
