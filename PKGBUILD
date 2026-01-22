# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="river-bedload"
pkgver=0.2.0
pkgrel=2
pkgdesc="Print river compositor info in STDOUT"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~novakane/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'river'
  'wayland'
)
makedepends=(
  "zig>=${_zig}"
  'wayland-protocols'
)
_zigdepends=(
  # river-bedload
  "zig-wayland-v0.4.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.4.0.tar.gz"
)
_pkgsrc="${url##*/}-v${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
b2sums=('bdcdd60b11287c7a7b8a95b2d0cd39672351343c75ad344c2747035c7f7a2256c0a033890611e267491f0dd9b7f85312dc7aca7e3a7a11cb20ccd36281fcd75c'
        '1c33b878c3efdf20eef58ddd6f8a6cab99a24e7481f9a3b8f31b19b58d13372d8dea84dfb26b4097123ca25b1d38939e9b987d70eb3a23fe0fecf9f21fe6f8a2')

prepare() {
  cd "${srcdir}"
  for _zigdepend in "${_zigdepends[@]}"; do
    zig fetch --global-cache-dir "zig-global-cache" "${_zigdepend%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#     -Dpie=true
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" zig build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
