# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="minizign"
_commit_rel="b00a331c225a55ce8736872a8394c80fc44f7ef6" # 0.1.4
_commit="9ba13dcad472bd219b30e2957c8487bae50c6e71" # r10
pkgver="0.1.4+r10+g${_commit::7}"
pkgrel=1
pkgdesc="Minisign reimplemented in Zig"
arch=('x86_64')
url="https://github.com/jedisct1/zig-minisign"
license=('ISC')
depends=(
  'glibc'
)
makedepends=(
  'zig>=0.15.1'
  'zig<0.16'
)
_pkgsrc="${url##*/}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('6db98cdedb2ba164a9985e918738f1e59d56832aee45eca2a2e29aca8087fddb19efcf9971d679297dc3ad13822a36227e40101ad8985186ae93972e254f6a49')

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
  #find "build" -type f -name '*.zig' -delete
}

check() {
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
  DESTDIR="check" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va --no-preserve=ownership build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
