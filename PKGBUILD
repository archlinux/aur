# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=buildifier
pkgver=10.1.0
pkgrel=3
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
url='https://github.com/bazelbuild/buildtools'
depends=('glibc')
makedepends=('bazelisk' 'git')
conflicts=('buildifier-bin')
# rules_go trims source paths from the binary, so the generated debug package
# contains no sources and only a dangling build-id symlink.
options=('!debug')
_commit='d12fe38eb8b1680838af70fe9a797feb9c3f71ba'
source=("${pkgname}::git+$url.git#commit=$_commit")
md5sums=('SKIP')

_bazel() {
  local flag options=(
    '--compilation_mode=opt'
    '--strip=never'
    # Bazel's outputs are read-only which prevents makepkg from cleaning up.
    '--experimental_writable_outputs'
    # Bazel defines _FORTIFY_SOURCE=1 in opt mode which conflicts with CFLAGS.
    '--copt=-Wp,-U_FORTIFY_SOURCE'
    # Bazel prefers lld or gold when installed; use the system default linker.
    '--linkopt=-fuse-ld=bfd'
    # Stamps the version and commit reported by `buildifier --version`.
    '--config=release'
    '--@io_bazel_rules_go//go/config:linkmode=pie'
    '--@io_bazel_rules_go//go/config:gc_linkopts=-extldflags,-Wl,-zrelro,-extldflags,-Wl,-znow'
  )
  for flag in ${CPPFLAGS}; do options+=("--copt=${flag}"); done
  for flag in ${CFLAGS}; do options+=("--conlyopt=${flag}"); done
  for flag in ${CXXFLAGS}; do options+=("--cxxopt=${flag}"); done
  for flag in ${LDFLAGS}; do options+=("--linkopt=${flag}"); done
  BAZELISK_HOME="${srcdir}/bazelisk" bazelisk \
    --output_user_root="${srcdir}/bazel" --max_idle_secs=60 "${1}" "${options[@]}" "${@:2}"
}

prepare() {
  cd "${pkgname}" || exit

  _bazel fetch "//${pkgname}"
}

build() {
  cd "${pkgname}" || exit

  _bazel build --fetch=false "//${pkgname}"
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
