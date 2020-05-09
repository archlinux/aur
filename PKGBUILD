# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=bazel-bootstrap
pkgver=3.1.0
pkgrel=1
pkgdesc="(Bootstrap Build) Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=11' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf' 'python')
options=('!distcc' '!strip' '!ccache')
source=("bazel-bootstrap-${pkgver}.zip::https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip"
        "bazel-bootstrap-${pkgver}.zip.sig::https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip.sig"
)

sha512sums=('2e28b200af9b6075d406eb946c852005b0eefca2328138d42e5010520a5ac952d72276c9ed8d3a9750bfb1f167a068827ef6b94450c708f8e7140ffcaa29755c'
            'SKIP')
validpgpkeys=('71A1D0EFCFEB6281FD0437C93D5919B448457EE0')

build() {
  env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" ./compile.sh
  cd output
  ./bazel shutdown
}

package() {
  mkdir -p "${pkgdir}/opt/bazel-bootstrap/bin"
  install -Dm755 "${srcdir}/scripts/packages/bazel.sh" "${pkgdir}/opt/bazel-bootstrap/bin/bazel"
  install -Dm755 "${srcdir}/output/bazel" "${pkgdir}/opt/bazel-bootstrap/bin/bazel-real"
  for d in examples third_party tools; do
    cp -r "${srcdir}/${d}" "${pkgdir}/opt/bazel-bootstrap/"
  done
}
