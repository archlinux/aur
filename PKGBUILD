# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=bazel
pkgver=0.1.0
pkgrel=3
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=8' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf')
install=bazel.install
options=('!strip')
source=("https://github.com/bazelbuild/bazel/archive/${pkgver}.tar.gz")
sha256sums=('12a0fee716108fee8c0039551b9020fba3cf6c42262d304485d2788f8611ca41')

build() {
  cd ${pkgname}-${pkgver}
  HOME=$srcdir
  if (pacman -Q bazel &> /dev/null); then
    echo "bazel found - compiling with installed bazel"
    ./compile.sh build /usr/bin/bazel
  else
    echo "no installed bazel found - compiling from scratch"
    ./compile.sh
  fi
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
