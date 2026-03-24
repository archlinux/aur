# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="tigerbeetle"
pkgver=0.16.78
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
b2sums=('96934934c5d2389756d03c78013d19eaf2813a28e012036e3b143af17f2a3abf5f8785e8c3aeace5f507c3f94559f222b303e2d42863a4f3483f3ac005b95918'
        'c8d17b8bb0c7d77d39c15f8bf5a60e6daeecee7fd0dfb72ec3693a77e60d0f82f9d05b84b36126e0e933beed819a48bf7097997984c8be8cd7d1c1656bd47383')

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
