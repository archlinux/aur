# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=bazel-bootstrap
pkgver=3.0.0
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

sha512sums=('9947011db2719fc7d6abc48ad82abc06db9145ae36b2077d003cfb001a6d940e583c91e680a4c687f96cbdd1ec141bb24f598a85df361be0190b7b4d7a15ee3f'
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
