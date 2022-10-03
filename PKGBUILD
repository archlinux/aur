pkgname=knusperli-git
_pkgname="${pkgname%-git}"
pkgver=0.0.0.r10.g415439b
pkgrel=1
pkgdesc='A deblocking JPEG decoder'
arch=('x86_64')
url="https://github.com/google/knusperli/"
license=('Apache')
depends=(
  'gcc-libs'
)
makedepends=(
  'bazel'
  'git'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${pkgname}"::"git+${url}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${pkgname}"
  git tag v0.0.0 d9f1186bd361de372486166ef198485d27cf6b62
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # bazel crashes with newer versions of openjdk
  PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"

  cd "${srcdir}/${pkgname}"
  CC=gcc bazel build :knusperli
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  install "bazel-bin/knusperli" "${pkgdir}/usr/bin"
}
