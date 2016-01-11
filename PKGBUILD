# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=bazel
pkgver=0.1.3
pkgrel=1
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=8' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf')
install=bazel.install
options=('!strip')
source=("https://github.com/bazelbuild/bazel/archive/${pkgver}.tar.gz")
sha256sums=('5ba3e69b0867e00c3c765b499a5e836db791e3f2f5112f5684782eef5bab0218')

build() {
  cd ${pkgname}-${pkgver}
  HOME=$srcdir
  ./compile.sh
  ./output/bazel build scripts:bazel-complete.bash
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/output/bazel" "${pkgdir}/usr/bin/bazel"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bazel-bin/scripts/bazel-complete.bash" "${pkgdir}/etc/bash_completion.d/bazel-complete.bash"
  mkdir -p "${pkgdir}/opt/bazel/base_workspace"
  for d in examples third_party tools; do
    cp -r ${srcdir}/${pkgname}-${pkgver}/$d $pkgdir/opt/bazel/
    cd ${pkgdir}/opt/bazel/base_workspace
    ln -s /opt/bazel/$d ./
  done
}
