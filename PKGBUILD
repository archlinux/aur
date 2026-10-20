# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=zig
pkgname="minizign"
pkgver=0.1.14
pkgrel=1
pkgdesc="Minisign reimplemented in Zig"
arch=(
  'x86_64'
)
url="https://github.com/jedisct1/zig-minisign"
license=(
  'ISC'
)
makedepends=(
  'git'
  "zig>=0.17"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}?signed"
)
b2sums=('651f5fdf72fa1eef26687f0576bb94f7403b6df9c54a436eadfed08343112065a44ec2199904215cd7d89c6ae2252d38405b454f16de03700d729f2fad577f27')
validpgpkeys=(
  '54A2B8892CC3D6A597B92B6C210627AABA709FE1' # Frank Denis (Jedi/Sector One) <pgp@pureftpd.org>
)

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "${_zig}" build "${zig_options[@]}"
}

check() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "${_zig}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
