# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.11
pkgname="ansiscape"
_commit_rel="8474ab18a9803bc3edc83d8cf0142e3520470418" # 1.0.0
_commit="47c4caba6a8fdde43472e8bc11de55255d7ad86a" # r1
pkgver="1.0.0+r1+g${_commit::7}"
pkgrel=1
pkgdesc="Procedurally generated landscapes in your terminal"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~leon_plickat/${pkgname}"
license=(
  'GPL-3.0-only'
)
makedepends=(
  "zig${_zig}"
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
)
b2sums=('b04d0f140c6f5371d72e0425da2db416ce35edefefe06fe37f76c6ed4f9aaaf83dae4c74505eb11dc3e9c3270bda41386a0072bbb264743332924854a7b4b1ca')

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

  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
