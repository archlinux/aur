# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=bazel-git
pkgver=r24501.ab6134b185
pkgrel=1
pkgdesc="Correct, reproducible, and fast builds for everyone"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://bazel.io/"
license=('Apache')
depends=('java-environment=11' 'libarchive' 'zip' 'unzip')
makedepends=('git' 'protobuf' 'python' 'bazel-bootstrap')
options=('!distcc' '!strip' '!ccache')
provides=('bazel')
source=("${pkgname}::git+https://github.com/google/bazel.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  EXTRA_BAZEL_ARGS=()

  if [ -d "${HOME}/.ccache" ]
  then
    EXTRA_BAZEL_ARGS+=("--sandbox_writable_path" "${HOME}/.ccache")
  fi

  /opt/bazel-bootstrap/bin/bazel build //src:bazel scripts:bazel-complete.bash "${EXTRA_BAZEL_ARGS[@]}"
  /opt/bazel-bootstrap/bin/bazel shutdown
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 scripts/packages/bazel.sh "${pkgdir}/usr/bin/bazel"
  install -Dm755 bazel-bin/src/bazel "${pkgdir}/usr/bin/bazel-real"
  install -Dm644 bazel-bin/scripts/bazel-complete.bash "${pkgdir}/usr/share/bash-completion/completions/bazel"
  install -Dm644 scripts/zsh_completion/_bazel "${pkgdir}/usr/share/zsh/site-functions/_bazel"
  mkdir -p "${pkgdir}/opt/bazel"
  for d in examples third_party tools; do
    cp -r "${d}" "${pkgdir}/opt/bazel/"
  done
}
