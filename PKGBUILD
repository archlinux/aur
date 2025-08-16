# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
# Contributor: Manuel Barrio Linares <mbarriolinares at gmail dot com>

pkgname=c3c-git
_pkgname=c3c
pkgver=r3411.ad02fad1
pkgrel=1
pkgdesc='Compiler for the C3 language'
arch=(x86_64)
url='https://github.com/c3lang/c3c'
license=(LGPL-3.0-or-later MIT)
depends=(curl lld llvm-libs)
makedepends=(clang cmake git libedit llvm)
provides=('c3c')
conflicts=('c3c')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  # Pretend that git is missing and define the git hash manually
  sed -i '/find_package(Git /d' CMakeLists.txt git_hash.cmake
  sed -i "s/unknown/$(git rev-parse HEAD)/g" git_hash.cmake
}

build() {
  CXXFLAGS="-Wno-error=maybe-uninitialized"
  CFLAGS="-Wno-error=maybe-uninitialized"
  cmake \
    -B build \
    -D C3_LINK_DYNAMIC=ON \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
    -D CMAKE_C_FLAGS_RELEASE="$CFLAGS" \
    -S $_pkgname
  cmake --build build
}

package() {
  install -Dm755 build/c3c "$pkgdir/usr/lib/$_pkgname/c3c"
  cp -r build/lib "$pkgdir/usr/lib/$_pkgname/lib"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/c3c" "$pkgdir/usr/bin/c3c"
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 $_pkgname/LICENSE_SRC "$pkgdir/usr/share/licenses/$_pkgname/LICENSE_SRC"
}
