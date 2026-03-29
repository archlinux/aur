# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="anyzig"
pkgver=2026_03_26
_zig=0.14.0
pkgrel=1
pkgdesc="One zig to rule them all"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://github.com/marler8997/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  # "zig>=${_zig}"
  "zig${_zig%.*}"
)
_zigdepends=(
  # anyzig
  "zig-${_zig}.tar.gz::https://github.com/ziglang/zig/archive/refs/tags/${_zig}.tar.gz"
  "zipcmdline-3dfca786a489d117e4b72ea10ffb4bbd9fc2dd72.tar.gz::https://github.com/marler8997/zipcmdline/archive/3dfca786a489d117e4b72ea10ffb4bbd9fc2dd72.tar.gz"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  # "${pkgname}_zig_zon_hash.patch"
  # "${_zigdepends[@]}"
)
# noextract=(
#   "${_zigdepends[@]%%::*}"
# )
b2sums=('a13ee594fa0b1c280676e88be73b2f382eeab826e5d107fe60116f552de9bd4cea50a4ffe7059d232b893368f4bcbe5b4db981aa05696f2fd3f718495cab8382')
           
# prepare() {
#   cd "${srcdir}/${_pkgsrc}"
#   patch -Np1 -i "${srcdir}/${pkgname}_zig_zon_hash.patch"
# 
#   cd "${srcdir}"
#   for dep in "${_zigdepends[@]}"; do
#     "zig${_zig%.*}" fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
#   done
# }

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_zig%.*}" build "${zig_options[@]}"
}

# tests require an internet connection and download huge files
# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr#
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="build" "zig${_zig%.*}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${pkgname}"
}
