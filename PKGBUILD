# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.14 # 0.15
pkgname="zon2nix"
_commit_rel="a58fa187e1cce902cf1ce521df4f2cf9c07a59d1" # 0.1.2
_commit="2360e358c2107860dadd340f88b25d260b538188" # r62
pkgver="0.1.2+r62+g${_commit::7}"
pkgrel=1
pkgdesc="Convert the dependencies in build.zig.zon to a Nix expression"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/nix-community/${pkgname}"
license=(
  'MPL-2.0'
)
depends=(
  'nix'
)
makedepends=(
  # "zig${_zig}"
  "zig${_zig}-bin"
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
)
b2sums=('2842a9b079b3d0a1e3252dd4429ab64a7b21c89a897e89c82526c8831de8ea1a605d04066da0611d33c9980ac323740d056c33a7028bb4878a30c31e5c07fac6')

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
    # -Doptimize=ReleaseSafe
    -Doptimize=ReleaseFast
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

check() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    # -Doptimize=ReleaseSafe
    -Doptimize=ReleaseFast
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig${_zig}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
