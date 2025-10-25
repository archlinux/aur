# Maintainer: David Wu <daichuan at dwu21 dot net>

pkgname='lexbor'
pkgdesc='An in-development browser engine with minimal dependencies'
arch=('x86_64')
url='https://lexbor.com'
license=('Apache-2.0')

depends=(glibc)

makedepends=(
  git
  cmake
)

pkgver='2.5.0'
_tag='7fb22cf5664a331d7c24b113489e566767c9c25a' # git rev-parse tags/v2.5.0
pkgrel='1'
source=("git+https://github.com/lexbor/lexbor.git#tag=${_tag}")

sha256sums=('b92011a38bc9d19b065331d2abf7cdd8868264eb170700c7acd1deb76c89c685')
b2sums=('9c92e798d92bc148efe3fad703d2375a4e73ee594d831e528401588d1badcc5a4a46e878e1100e05ec8979806231e23af77193473c157e317829f7b695dde009')

build() {
  cmake -B "${srcdir}/build" -S "${srcdir}/${pkgname}" \
    -DLEXBOR_BUILD_SHARED=ON \
    -DLEXBOR_BUILD_STATIC=OFF \
    -DLEXBOR_BUILD_TESTS=ON \
    -DLEXBOR_BUILD_TESTS_CPP=ON \
    -DLEXBOR_INSTALL_HEADERS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  cd "${srcdir}/build"
  make
}

check() {
  cd "${srcdir}/build"
  make test
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install

  cd "${srcdir}/${pkgname}"

  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" NOTICE
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
