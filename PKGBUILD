# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="zigmir"
pkgver=0.0.6
pkgrel=1
pkgdesc="A blazing-fast Linux distro mirror speed tester written in Zig"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/rownix101/${pkgname}"
license=(
  'MIT'
)
makedepends=(
  "zig>=${_zig}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
b2sums=('b8c9fcf0130dc9ea82dd298f8d487fcd4a229307e7b21ea84ee625fc49fbac4f17e3fcf401b3f238f75abb0ec0282cd9210f13aa74f92af8ef8f7e020eac63e3')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "completions"
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
  DESTDIR="build" zig build "${zig_options[@]}"

  for _sh in bash fish zsh; do
    ./"build/usr/bin/pacman_mirror_speedtest" --completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
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
  DESTDIR="check" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # cp -vaT --no-preserve=ownership "build" "${pkgdir}"
  install -vDm755 "build/usr/bin/pacman_mirror_speedtest" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
