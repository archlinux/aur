# Maintainer: Paul Mulders <justinkb@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Konstantin Gizdov <arch@kge.pw>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=bazel4
pkgver=4.2.2
pkgrel=1
pkgdesc='Correct, reproducible, and fast builds for everyone'
arch=('x86_64')
license=('Apache')
url='https://bazel.build/'
depends=('java-environment=11' 'libarchive' 'zip' 'unzip')
makedepends=('gcc10' 'git' 'protobuf' 'python')
provides=("bazel-${pkgver}")
conflicts=('bazel')
options=('!distcc' '!strip')
source=("https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip"
        "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip.sig")
sha512sums=('123f73dc87053e37705bb729f82bd722d6d2799fe106f79c51cf5566fb2771d824108cbe275aad55ae590b970c549008b433704cbf1245394769e950796eb8db'
            'SKIP')
validpgpkeys=('71A1D0EFCFEB6281FD0437C93D5919B448457EE0')

build() {
  # https://github.com/bazelbuild/bazel/issues/13613
  CC=/usr/bin/gcc-10 \
  CXX=/usr/bin/g++-10 \
  EMBED_LABEL=$pkgver EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" ./compile.sh
  # https://github.com/bazelbuild/bazel/issues/13613
  CC=/usr/bin/gcc-10 \
  CXX=/usr/bin/g++-10 \
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
