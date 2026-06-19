# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=zig
pkgname="zigdown"
pkgver=1.3.0
pkgrel=1
pkgdesc="Parse and render Markdown-like content to the terminal, to HTML, or inside Neovim"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/JacobCrabill/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  "zig>=0.16"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('cbbffae3c4859668a8a3a00b23f487123eeec03ffad22a026c746198ae68474d9545b06f126191ff303aa22d550be551d6f53556bb179b8a7f6886a63f539ff8')

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "${_zig}" build "${zig_options[@]}"
  find "build" -type f -name '*.wasm' -delete
}

check() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "${_zig}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
