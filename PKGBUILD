# Maintainer: Rajdeep Malakar <nobody@rajdeepm.xyz>
# Contributor: Rajdeep Malakar <nobody@rajdeepm.xyz>

__lib=flags
__desc="A pure-C Library to parse command line arguments"
__ver=0.0.1
pkgname=hay-${__lib}-git
pkgdesc="${__desc}"
pkgver=0.0.1+r47.5a046d7
pkgrel=1
arch=('any')
url="https://codeberg.org/hay/${__lib}"
license=('MPL-2.0')
makedepends=('cmake' 'gcc' 'make')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${__lib}"
  local commit_hash
  local rev
  commit_hash=$(git rev-parse --short HEAD)
  rev=$(git rev-list --count ${commit_hash})
  printf "%s+r%s.%s" "${__ver}" "${rev}" "${commit_hash}"
}

build() {
  cd "$srcdir/${__lib}"
  cmake -B build \
        -S . \
        -DBUILD_tests=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DSHARED_${__lib}=ON
  cmake --build build
}

check() {
  cd "$srcdir/${__lib}"
  # Run the tests
  ctest --test-dir build
}

package() {
  cd "$srcdir/${__lib}"
  cmake --install build --prefix="$pkgdir/usr"
}
