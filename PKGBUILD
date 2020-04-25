pkgname=bazel024
pkgver=0.24.1
pkgrel=1
pkgdesc='Correct, reproducible, and fast builds for everyone'
arch=('x86_64')
license=('Apache')
url='https://bazel.io/'
depends=('java-environment=11' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf' 'python')
provides=("bazel=${pkgver}")
conflicts=('bazel')
options=('!distcc' '!strip')
source=("https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip"
        "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip.sig"
        grpc_rename_gettid.patch)
sha512sums=('a78c871eb517ec53a0d1d9592887288fa54e5e9f44b0b7dba44792a74a1ba0c98e38ff2f6094ab6e8b3add3ec4a0188de3b2489d94d419373e210d16db641774'
            'SKIP' 'SKIP')
validpgpkeys=('71A1D0EFCFEB6281FD0437C93D5919B448457EE0')

prepare () {
  # https://github.com/bazelbuild/bazel/issues/9391
  curl -L https://github.com/bazelbuild/bazel/commit/b8e1bb18fae89898b0d28535c6355e67b7d4239e.patch | patch -p1
  curl -L https://github.com/bazelbuild/bazel/pull/9394.patch | patch -p1

  # https://github.com/bazelbuild/bazel/issues/8666
  pushd third_party/grpc && patch -p0 -i "$srcdir/grpc_rename_gettid.patch"
}

build() {
  env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" ./compile.sh
  ./output/bazel build scripts:bazel-complete.bash
  cd output
  ./bazel shutdown
}

package() {
  install -Dm755 "${srcdir}/scripts/packages/bazel.sh" "${pkgdir}/usr/bin/bazel"
  install -Dm755 "${srcdir}/output/bazel" "${pkgdir}/usr/bin/bazel-real"
  install -Dm644 "${srcdir}/bazel-bin/scripts/bazel-complete.bash" "${pkgdir}/usr/share/bash-completion/completions/bazel"
  install -Dm644 "${srcdir}/scripts/zsh_completion/_bazel" "${pkgdir}/usr/share/zsh/site-functions/_bazel"
  mkdir -p "${pkgdir}/opt/bazel"
  for d in examples third_party tools; do
    cp -r "${srcdir}/${d}" "${pkgdir}/opt/bazel/"
  done
}
# vim:set ts=2 sw=2 et:
