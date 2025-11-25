# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="minizign"
pkgver=0.1.7
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
  "zig>=${_zig}"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}?signed"
)
b2sums=('287ea362c1973b97ebd7ceb1ba066637f128df0a0f25706b66f429040682e9bed1c7e28c874d7da422e4c67d1787aca48441db4986bd987cfbf84a8f246d91c7')
validpgpkeys=(
  '54A2B8892CC3D6A597B92B6C210627AABA709FE1' # Frank Denis (Jedi/Sector One) <pgp@pureftpd.org>
)

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
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
