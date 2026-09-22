# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=buildifier
pkgver=10.1.0
pkgrel=1
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
url='https://github.com/bazelbuild/buildtools'
depends=('glibc')
makedepends=('bazelisk' 'git')
conflicts=('buildifier-bin')
# Bazel does not honor makepkg's DEBUG_CFLAGS, so the generated debug package
# contains no sources and only a dangling build-id symlink.
options=('!debug')
_commit='d12fe38eb8b1680838af70fe9a797feb9c3f71ba'
source=("${pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')
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
  # The bazel server occasionally fails to terminate in a timely fashion which
  # is not fatal to the build.
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
