# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=bazel
pkgver=0.3.0
pkgrel=1
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment>=8' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf')
options=('!distcc' '!strip')
source=("https://github.com/bazelbuild/bazel/archive/${pkgver}.tar.gz")
sha512sums=('2397e1d2046c130c6f8a353d4c38dabb50a2786c5d73bf896f4b2fa2e743b454550ef07398f24da7395245b21a2f3bd86c8818ca15a838a69d30660e628d716d')

build() {
  cd ${pkgname}-${pkgver}
  ./compile.sh
  ./output/bazel build scripts:bazel-complete.bash
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/output/bazel" "${pkgdir}/usr/bin/bazel"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bazel-bin/scripts/bazel-complete.bash" "${pkgdir}/etc/bash_completion.d/bazel-complete.bash"
  mkdir -p "${pkgdir}/opt/bazel/"
  for d in examples third_party tools; do
    cp -r ${srcdir}/${pkgname}-${pkgver}/$d $pkgdir/opt/bazel/
  done
}
