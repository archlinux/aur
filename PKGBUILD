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

pkgver='2.6.0'
_tag='e142a9b495064cd718cf442ffe23b51ea089d9d6' # git rev-parse tags/v2.6.0
pkgrel='1'
source=("git+https://github.com/lexbor/lexbor.git#tag=${_tag}")

sha256sums=('4f63bc194a5859ff4894f8f8903f2041b63309b6ddf9fb21540103d7679f8afd')
b2sums=('dfa8669fbff1370e658aceaec5eb3a26b1fc0397ebfeb3e064c28109c10f4b51ab50317fb4e96193e61784d9c7006aa7ff1e59390671362b71360aec4895aa0f')

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
