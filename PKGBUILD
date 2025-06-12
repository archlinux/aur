# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildozer
pkgver=8.2.1
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64' 'aarch64')
license=('Apache')
url='https://github.com/bazelbuild/buildtools'
makedepends=('git' 'python')
conflicts=('buildozer-bin')
_commit='b1e23f1025b8556cc75eebb28ff7f40b8930d353'
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

prepare() {
  chmod +x "${srcdir}/bazelisk-bin-${CARCH}-${_bazelisk_pkgver}"
}

build() {
  cd "${pkgname}" || exit

  "${srcdir}/bazelisk-bin-${CARCH}-${_bazelisk_pkgver}" build --config=release "//${pkgname}"
  "${srcdir}/bazelisk-bin-${CARCH}-${_bazelisk_pkgver}" shutdown
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

