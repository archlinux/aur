# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Robert Hamblin <hamblingreen@hotmail.com>
# Contributor: Rene Hickersberger <r@renehsz.com>
# Contributor: Dimitri Kaparis <dimitri@kaparis.name>

_zig=0.14
pkgname="mepo"
pkgver=1.3.4
pkgrel=1
pkgdesc="Fast, simple, and hackable OSM map viewer. Works both offline and online."
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://git.sr.ht/~mil/${pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'curl'
  'findutils'
  'geoclue'
  'glibc'
  'hicolor-icon-theme'
  'jq'
  'ncurses'
  'sdl2'
  'sdl2_gfx'
  'sdl2_image'
  'sdl2_ttf'
  'sh'
  'xorg-xwininfo'
  'zenity'
)
makedepends=(
  # "zig${_zig}"
  "zig${_zig}-bin"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha512sums=('ef45de275e46c25ba4aedf6a27298c6b0ce5c751bd0680d37dca81baf86f059be05574d0655013ba405d45d958b1fef3d795050efa2db4fad6ca7f47aa577cb7')

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
  find "build" -type f -name '*.sh' -exec \
    sed -i 's|libexec|lib|g' "{}" +

  ./"build/usr/bin/${pkgname}" -docmd > "MANUAL.md"
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
  DESTDIR="check" "zig${_zig}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "MANUAL.md" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
