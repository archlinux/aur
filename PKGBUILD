# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=bazel-bootstrap
pkgver=3.2.0
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

sha512sums=('fd8191188ecb49087b2b474bc383b2bb5d131460952be64b8930dc7e573fd14f99f231c4270b88fb4c9537fb94a04588fb580891519d20c7b90d705238f17f81'
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
