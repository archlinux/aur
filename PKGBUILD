# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14
pkgname="doom-fire"
pkgver=2025.4
pkgrel=1
pkgdesc="DOOM's fire algo, in zig, for 256 color terminals w/no dependencies"
arch=(
  'x86_64'
)
url="https://github.com/const-void/DOOM-fire-zig"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
)
makedepends=(
  # "zig${_zig}"
  "zig${_zig}-bin"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('bfe2a9f5eed5902d521e1e4988b12f9db0b9130703a5397f260f3b9322e25d9664d9e288395e73c4eb6450961948019da0cb32d072f7c876f18aa2fc5a528068')

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
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
