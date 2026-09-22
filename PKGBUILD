# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildozer
pkgver=10.1.0
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
url='https://github.com/bazelbuild/buildtools'
depends=('glibc')
makedepends=('bazelisk' 'git')
conflicts=('buildozer-bin')
# Bazel does not honor makepkg's DEBUG_CFLAGS, so the generated debug package
# contains no sources and only a dangling build-id symlink.
options=('!debug')
_commit='d12fe38eb8b1680838af70fe9a797feb9c3f71ba'
source=("${pkgname}::git+$url.git#commit=$_commit")
_bazelisk_pkgver="1.25.0"
source_x86_64=(
  "bazelisk-bin-x86_64-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-amd64"
)
source_aarch64=(
  "bazelisk-bin-aarch64-${_bazelisk_pkgver}::https://github.com/bazelbuild/bazelisk/releases/download/v${_bazelisk_pkgver}/bazelisk-linux-arm64"
)
md5sums=('SKIP')
sha256sums_x86_64=('fd8fdff418a1758887520fa42da7e6ae39aefc788cf5e7f7bb8db6934d279fc4')
sha256sums_aarch64=('4c8d966e40ac2c4efcc7f1a5a5cceef2c0a2f16b957e791fa7a867cce31e8fcb')
_BAZEL_OPTIONS=(
  '--config=release'
  '--@io_bazel_rules_go//go/config:linkmode=pie'
  '--@io_bazel_rules_go//go/config:gc_linkopts=-extldflags,-Wl,-znow,-extldflags,-Wl,-zrelro'
  '--linkopt=-Wl,--as-needed'
)

prepare() {
  cd "${pkgname}" || exit

  bazelisk fetch "${_BAZEL_OPTIONS[@]}" "//${pkgname}"
}

build() {
  cd "${pkgname}" || exit

  bazelisk build "${_BAZEL_OPTIONS[@]}" --fetch=false "//${pkgname}"
  bazelisk shutdown || true
}

package() {
  cd "${pkgname}" || exit

  # Install the license file
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./bazel-bin/${pkgname}/${pkgname}_/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
}
