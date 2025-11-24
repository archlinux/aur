# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="tigerbeetle"
pkgver=0.16.65
pkgrel=1
pkgdesc="The financial transactions database designed for mission critical safety and performance"
arch=(
  'aarch64'
  'x86_64'
)
url="https://tigerbeetle.com"
_url="https://github.com/${pkgname}/${pkgname}"
license=(
  'Apache-2.0'
)
makedepends=(
  'jq'
  # 'llvm19'
  # "zig${_zig}"
  "zig${_zig}-bin"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
  "${_pkgsrc}.github.json::https://api.github.com/repos/${pkgname}/${pkgname}/git/ref/tags/${pkgver}"
)
b2sums=('ba45183a7fef97e3f34e1a74f52fdb7f6914bfae596b76caae3380a6b94e4ed93b368a7a32ad42e765e5f05e797a3972d9eb9ceb5dedb45191ab5df892d236a2'
        'f3a7f7fc38075df6f2fc75a27cc646914ac64e64c9d1bbd7994370e0fc6d86e01ae803d273dc1fa1f6e221e9d1b7f4640205f797a256a021b39a1ba1cf3090cb')

build() {
  cd "${srcdir}"
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    # -Dtarget=native-linux.6.15-gnu.2.42
    # -Dcpu=baseline
    # -Doptimize=ReleaseSafe
    -Drelease=true
    -Dtarget="${CARCH}-linux"
    -Dconfig-release="${pkgver%%+*}"
    -Dconfig-release-client-min="${pkgver%%+*}"
    -Dgit-commit="$(jq .object.sha "${_pkgsrc}.github.json" -r)"
    # -Dllvm-objcopy="llvm-objcopy-19"
  )

  cd "${_pkgsrc}"
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

# build() {
#   cd "${srcdir}"
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     # -Dtarget=native-linux.6.15-gnu.2.42
#     # -Dcpu=baseline
#     # -Doptimize=ReleaseSafe
#     -Drelease=true
#     -Dtarget="${CARCH}-linux"
#     -Dconfig-release="${pkgver%%+*}"
#     -Dconfig-release-client-min="${pkgver%%+*}"
#     -Dgit-commit="$(jq .object.sha "${_pkgsrc}.github.json" -r)"
#     -Dllvm-objcopy="llvm-objcopy-19"
#   )

#   cd "${_pkgsrc}"
#   DESTDIR="check" "zig${_zig}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  # cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "build"
  cp -va --no-preserve=ownership "usr" -t "${pkgdir}"
}
