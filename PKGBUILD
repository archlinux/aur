# Merged with official ABS kdsoap PKGBUILD by João, 2021/02/18 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kdsoap-git
pkgver=2.2.95_r1972.ga14f3001
pkgrel=1
pkgdesc='Qt-based client-side and server-side SOAP component'
arch=($CARCH)
url='https://github.com/KDAB/KDSoap'
license=(GPL3 LGPL custom)
depends=(gcc-libs glibc)
makedepends=(git cmake qt5-base qt6-base)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd KDSoap
  git submodule update --init --recursive
}

pkgver() {
  cd KDSoap
  _major_ver="$(grep -m1 'set(${PROJECT_NAME}_VERSION_MAJOR' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')')"
  _minor_ver="$(grep -m1 'set(${PROJECT_NAME}_VERSION_MINOR' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')')"
  _patch_ver="$(grep -m1 'set(${PROJECT_NAME}_VERSION_PATCH' CMakeLists.txt | cut -d ' ' -f2 | tr -d ')')"
  echo "${_major_ver}.${_minor_ver}.${_patch_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S KDSoap \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 KDSoap/LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
