# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=zig
pkgname="zigdown"
pkgver=1.3.1
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
  "zig>=0.16.0"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('948a767327343fc5d71763a3571240496c12ebb13a1e94a2fc50213427455e5feeac345a18b88f59159f3bf1b232cb024ced5536b2ed7401b9248fe728904ab1')

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
