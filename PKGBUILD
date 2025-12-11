# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname="ibazel"
pkgver=0.28.0
pkgrel=1
pkgdesc="Tool for building Bazel targets when source files change."
arch=("x86_64" "aarch64")
license=("Apache 2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("git" "python")
depends=("bazel")
conflicts=('ibazel-bin' 'ibazel-git')
_bazelisk_pkgver="1.25.0"
_commit='ebb7a07eba2a1c8d5a0bcc9618d0955634d3b4c8'
source=("${pkgname}::git+$url.git#commit=$_commit")
source_x86_64=(
  "bazelisk-bin-x86_64-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-amd64"
)
source_aarch64=(
  "bazelisk-bin-aarch64-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-arm64"
)
sha256sums=('SKIP')
sha256sums_x86_64=('fd8fdff418a1758887520fa42da7e6ae39aefc788cf5e7f7bb8db6934d279fc4')
sha256sums_aarch64=('4c8d966e40ac2c4efcc7f1a5a5cceef2c0a2f16b957e791fa7a867cce31e8fcb')

prepare() {
  chmod +x "${srcdir}/bazelisk-bin-${CARCH}-${_bazelisk_pkgver}"
}

build() {
  cd "${pkgname}" || exit

  if [ "${CARCH}" == "aarch64" ]; then
    _platforms="--platforms=@io_bazel_rules_go//go/toolchain:linux_arm64"
  else
    _platforms="--platforms=@io_bazel_rules_go//go/toolchain:linux_amd64"
  fi

  "${srcdir}/bazelisk-bin-${CARCH}-${_bazelisk_pkgver}" \
    build --config=release "${_platforms}" \
    "//cmd/${pkgname}"
}

package() {
  cd "${pkgname}" || exit

  install -Dm755 \
    ./bazel-bin/cmd/${pkgname}/${pkgname}_/${pkgname} \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
