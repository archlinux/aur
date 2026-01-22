# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="zelbar"
pkgver=1.2.0
pkgrel=2
pkgdesc="Wayland statusbar reading input from STDIN"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~novakane/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'fcft>=3.3.2'
  'glibc'
  'pixman'
  'wayland'
)
makedepends=(
  "zig>=${_zig}"
  'wayland-protocols'
)
_zigdepends=(
  # zelbar
  "zig-pixman-v0.3.0.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.3.0.tar.gz"
  "zig-wayland-v0.4.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.4.0.tar.gz"
  "zig-fcft-v3.0.0.tar.gz::https://git.sr.ht/~novakane/zig-fcft/archive/v3.0.0.tar.gz"
)
_pkgsrc="${url##*/}-v${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
b2sums=('cea9290c4fdc8b6ce0c5d66eef72f27acdd1ffbea462e461e16516f2148f98c016d984589b11b0bcf00360d2178591c8128c27bc370df941e7ee56b5bc18b5c6'
        '8d6607e878b0bacc0fc16bcc2264ddd89e349b61a1b269e59b2e19b311064453a473f2401103b0e40906f7190d154d403b712e05fe937abe2f6253f7d8337820'
        '1c33b878c3efdf20eef58ddd6f8a6cab99a24e7481f9a3b8f31b19b58d13372d8dea84dfb26b4097123ca25b1d38939e9b987d70eb3a23fe0fecf9f21fe6f8a2'
        'f22f9e003624ed9c3f9752b50d1273a1be1e5a091605796cab582b09aa39d8f4b8d1c708b23a1eb0dc7e52a70a9829d3482c1310856f5bc24dbeff09c81c3000')

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

check() {
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
  DESTDIR="check" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
