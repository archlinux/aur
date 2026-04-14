# Maintainer: Dr. Abiira Nathan <nabiira2by2@gmail.com>
# Contributor: Dr. Abiira Nathan <nabiira2by2@gmail.com>

pkgname=solidc-git
pkgver=1.10.3.r0.gca5e38b
pkgrel=1
pkgdesc="A robust C library for data structures, concurrency, and utilities."
arch=('x86_64' 'aarch64')
url="https://github.com/abiiranathan/solidc"
license=('MIT')
depends=()
makedepends=('cmake' 'git' 'make' 'gcc')
provides=('solidc')
conflicts=('solidc')
source=("solidc::git+https://github.com/abiiranathan/solidc.git")
b2sums=('SKIP')

pkgver() {
  cd solidc
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd solidc
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=ON \
    -DBUILD_BENCHMARKS=OFF \
    -DBUILD_SHARED_LIBS=OFF
  cmake --build build
}

# Run the tests after building but before packaging
check() {
  cd solidc
  ctest --test-dir build --output-on-failure
}

package() {
  cd solidc
  DESTDIR="${pkgdir}" cmake --install build

  # Install README and License
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
