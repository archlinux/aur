# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="tigerbeetle"
pkgver=0.17.6
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
b2sums=('e3c6adb41952463e90817813244a962e21964eaa4f76191cb7c9a092f83e8244bf17ab592248cffcf393195d277811cf2d9412efccfb21233eef5eec5d827f04'
        '18092485cb040a4f3e9a22a461a1f7014fee3e006d4bb53cd825c92c3d55d075e216b9d2f86306d2f38e9e3e11cf9a6ee6806612fe818502ef9e55bc2932cdcd')

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
