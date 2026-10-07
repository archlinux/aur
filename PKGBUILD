# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Source: https://github.com/jmelahman/pkgbuilds

pkgname="ibazel"
pkgver=0.33.0
pkgrel=2
pkgdesc="Tool for building Bazel targets when source files change."
arch=("x86_64" "aarch64")
license=("Apache-2.0")
url="https://github.com/bazelbuild/bazel-watcher"
makedepends=("git" "python")
depends=("bazel")
conflicts=('ibazel-bin' 'ibazel-git')
_commit='ed00d96be0ce5b01aa2c43abbcd29172d4573091'
source=(
  "${pkgname}::git+$url.git#commit=$_commit"
  'bazel-9.patch'  # https://github.com/bazelbuild/bazel-watcher/pull/847
)
sha256sums=(
  'SKIP'
  'a9f7dbc265d25a1de8ede1c51da0579af01b461651312bdbe3e7d06b3d6318c9'
)

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
    # Stamps the version reported by `ibazel version`.
    '--config=release'
    '--lockfile_mode=error'
    '--@io_bazel_rules_go//go/config:linkmode=pie'
    '--@io_bazel_rules_go//go/config:gc_linkopts=-extldflags,-Wl,-zrelro,-extldflags,-Wl,-znow'
  )
  # The _cgo platforms pull in a C++ toolchain so the binary is linked
  # externally, which is required for the -z relro,now linker flags above.
  if [ "${CARCH}" == "aarch64" ]; then
    options+=('--platforms=@io_bazel_rules_go//go/toolchain:linux_arm64_cgo')
  else
    options+=('--platforms=@io_bazel_rules_go//go/toolchain:linux_amd64_cgo')
  fi
  for flag in ${CPPFLAGS}; do options+=("--copt=${flag}"); done
  for flag in ${CFLAGS}; do options+=("--conlyopt=${flag}"); done
  for flag in ${CXXFLAGS}; do options+=("--cxxopt=${flag}"); done
  for flag in ${LDFLAGS}; do options+=("--linkopt=${flag}"); done
  bazel --output_user_root="${srcdir}/bazel" --max_idle_secs=60 "${1}" "${options[@]}" "${@:2}"
}

prepare() {
  cd "${pkgname}" || exit

  rm .bazelversion
  patch -Np1 -i "${srcdir}/bazel-9.patch"
  # Keep the changes above from stamping the version as "-dirty".
  git ls-files -z --modified | xargs -0 git update-index --assume-unchanged
  _bazel fetch "//cmd/${pkgname}"
}

build() {
  cd "${pkgname}" || exit

  _bazel build --fetch=false "//cmd/${pkgname}"
}

package() {
  cd "${pkgname}" || exit

  install -Dm755 \
    ./bazel-bin/cmd/${pkgname}/${pkgname}_/${pkgname} \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
