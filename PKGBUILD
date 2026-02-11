# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="tigerbeetle"
pkgver=0.16.72
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
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${_pkgsrc}.github.json::https://api.github.com/repos/${pkgname}/${pkgname}/git/ref/tags/${pkgver}"
)
b2sums=('163b5874e42258b2912c7f2534e3ddb48d7e9f275d99affd8d8491cbf488ecdcef957cd075e50bf7008208f8c7434fd5c751769a86681d124be8812dcda062ee'
        '574d09a69707bd9c3ce823c275ff56dffd8d98956e747cc82f5653c906ba4a2219d01a91c5d7d81bf5d383ad3dc3967d12f36810578a5b188bd8589476aabfdb')

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
