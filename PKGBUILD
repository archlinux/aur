# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="rivercarro"
pkgver=0.6.0
pkgrel=1
pkgdesc="A slightly modified version of rivertile layout generator for river"
arch=('x86_64')
url="https://git.sr.ht/~novakane/rivercarro"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'wayland'
)
makedepends=(
  "zig>=${_zig}"
  'wayland-protocols'
)
_zigdepends=(
  # rivercarro
  "zig-wayland-0.4.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.4.0.tar.gz"
)
_pkgsrc="${url##*/}-v${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${_zigdepends[@]}")
noextract=("${_zigdepends[@]%%::*}")
b2sums=('22900ff20189df887ee478090572417392599de77bede3ff2acbca6a13ef60c7d046597671c5325adfed47268f7f6e54af0100dd15a050e736bd902ba54fdf80'
        '1c33b878c3efdf20eef58ddd6f8a6cab99a24e7481f9a3b8f31b19b58d13372d8dea84dfb26b4097123ca25b1d38939e9b987d70eb3a23fe0fecf9f21fe6f8a2')
           
prepare() {
  cd "${srcdir}"
  for dep in "${_zigdepends[@]}"; do
    zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
