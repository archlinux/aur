# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=bazel
pkgver=0.2.3
pkgrel=2
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=8' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf')
options=('!distcc' '!strip')
source=("https://github.com/bazelbuild/bazel/archive/${pkgver}.tar.gz")
sha256sums=('7e48bf3ef6da3afe619305708bfa09dde7f475ab8f1c3732faa0210a9b55c018')

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
