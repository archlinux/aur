# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Ratakor <ratakor@disroot.org>

_zig=0.15
pkgname=poop
_commit_rel="d1c737bdafbb6a52aef749db78072949e8cecd99" # 0.5.0
_commit="67ab6632c53af751a4d9cfb214ff67ef55fd1ceb" # r8
pkgver="0.5.0+r8+g${_commit::7}"
pkgrel=1
pkgdesc="Performance Optimizer Observation Platform"
arch=(
  'aarch64'
  'i686'
  'riscv64'
  'x86_64'
)
url="https://github.com/andrewrk/${pkgname}"
license=('MIT')
makedepends=(
  "zig>=${_zig}"
)
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('4aa25c114067433399caad57e66cf483e36d028ff48c2d1d0edf511bfade2c1a')

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
