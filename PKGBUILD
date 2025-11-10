# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Frederik Schwan <freswa at archlinux dot org>

_zig=0.13 # 0.11
pkgname="wayprompt"
pkgver=0.1.2
pkgrel=2
pkgdesc="Multi-purpose (password-)prompt tool for Wayland (pinentry)"
arch=(
  'x86_64'
)
url="https://git.sr.ht/~leon_plickat/${pkgname}"
license=(
  'GPL-3.0-only'
)
depends=(
  'fcft'
  'glibc'
  'libxkbcommon'
  'pixman'
  'sh'
  'wayland'
)
makedepends=(
  'wayland-protocols'
  "zig${_zig}"
)
_zigdepends=(
  "zig-ini-879c74a3a801d49fa34343aebd55a22f591899b3.tar.gz::https://git.sr.ht/~leon_plickat/zig-ini/archive/879c74a3a801d49fa34343aebd55a22f591899b3.tar.gz"
  "zig-spoon-fdba8e643c9558254bf4e6c600dfbd782fa7a267.tar.gz::https://git.sr.ht/~leon_plickat/zig-spoon/archive/fdba8e643c9558254bf4e6c600dfbd782fa7a267.tar.gz"
  "zig-pixman-0.2.0.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.2.0.tar.gz"
  "zig-wayland-0.2.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz"
  "zig-xkbcommon-0.2.0.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz"
  "zig-fcft-v1.1.0.tar.gz::https://git.sr.ht/~novakane/zig-fcft/archive/1.1.0.tar.gz"
)
_pkgsrc="${url##*/}-v${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
b2sums=('9ea451b64f2d53d7b4ff8b5bb1a85d13f4bade4d760284e85403ed76339c197d7055e57135e6cc8ad1847f56b736f0bb404a7e87c9c12d900300cda18ef49145'
        '87165bf620b009a7e13f380569d2501fcbe88af264a4e71b6571f9084d167330c1a4a91cab0b9898847228b01fa7be90020f4ca1cec7b6437f7629214d835bae'
        '3d284c2edf167b00b4576378ba980a01402da3051584bdb008bee12fbbecb7db24b8111d39955a967e60cfe797b11bdd11b353ef9b8e2c2b1c92a6aa6bc2eb93'
        '25e0e0a65ab45c08e13ed48393e0d009a63e0ec4c2d8452f08ec4b013f9b696adb1d7356a49b1c3b25710982fb34629002df8d433382d433fcdefd1de5fd4358'
        'aaf82efe78d25c59a87de050147857fcf9a19764141cb40d92b0dd48b96ea0ec52d00a1ab0df1afe4c45cda6d64dda97f296f0aa29d8b9ea3da49e1d5cd69e50'
        '85045d002b4ec1ac8dadda67d3ce6f588e53938ac0a67c06d6cebc85a944d7a23fd1cc295410ce1a91cce9ffb587834f7eca2400e1468fec0193583ac71d6f86'
        '8c4481876198cd45101aa4232d120d33a66ac75b565da3945d84a7feda5f0398fa8f3dee8ffd1692a4cd6a6cd35b93aab1ea331f27c7034f29e6ce142911738a')

prepare() {
  cd "${srcdir}"
  for dep in "${_zigdepends[@]}"; do
    "zig${_zig}" fetch --global-cache-dir "zig-global-cache" "${dep%%::*}"
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
  DESTDIR="build" "zig${_zig}" build "${zig_options[@]}"
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#     -Dpie=true
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "zig${_zig}" build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
