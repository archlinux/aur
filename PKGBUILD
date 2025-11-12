# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="arocc"
pkgname="${_pkgname}-git"
pkgver=r1908.g3fb778c
pkgrel=1
pkgdesc="A modern fully featured C compiler"
arch=(
  'x86_64'
)
url="https://github.com/Vexu/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  'anyzig'
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git"
)
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  anyzig version
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

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
  DESTDIR="build" anyzig build "${zig_options[@]}"
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
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" anyzig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "build/usr"
  cp -va --no-preserve=ownership "bin" -t "${pkgdir}/usr"
}
