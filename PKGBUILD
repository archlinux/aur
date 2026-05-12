# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="tigerbeetle"
pkgver=0.17.4
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
  "zig${_zig}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${_pkgsrc}.github.json::https://api.github.com/repos/${pkgname}/${pkgname}/git/ref/tags/${pkgver}"
)
b2sums=('54d7633ca94a2e6b1975a535be6b3431e17bab7de1b2074a73f49e4f1ffeb3e0b0cbcc259b7fe840735a41b3f39818456e8eed97493c7820725c0de34e1523f4'
        'cc95039b90c0c8eb35d501c29c4bfa3f274fcd5bce82f16c08404d5f34a661b12c336c84d48eab84106b0bb4d8fae4c01528984482b178d078c3eff1275980ac')

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
