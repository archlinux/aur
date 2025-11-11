# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.13
pkgname="drtl"
_commit_rel="39cc87eda5e7059de59e12acd3525458252cb0b3" # 1.0.0
_commit="f93ac5e59cfdfa25385da754fa8c5b107ef6fab7" # r1
pkgver="1.0.0+r1+g${_commit::7}"
pkgrel=1
pkgdesc="Yet another tldr client written in Zig"
arch=(
  'aarch64'
  'i686'
  'riscv64'
  'x86_64'
)
url="https://github.com/jiripospisil/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  "zig${_zig}"
)
_pkgsrc="${url##*/}-${_commit}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
)
b2sums=('60d4b95b017527284357c9abfed1c46b07ef42e2be0695b3655dbef6d9d72732b3b67855a8a06aba28b4e4c5da643fa028895e4a5b166c14fdb8b005ea439dd5')

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

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
