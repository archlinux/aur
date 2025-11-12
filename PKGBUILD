# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="xtxf"
pkgver=0.11.5
pkgrel=1
pkgdesc="The Matrix screensaver in Zig"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/charlesrocket/${pkgname}"
license=(
  'BSD-2-Clause'
)
depends=(
  'glibc'
)
makedepends=(
  'git'
  "zig>=${_zig}"
)
_zigdepends=(
  "termbox2-9c9281a9a4c971a2be57f8645e828ec99fd555e8.tar.gz::https://github.com/termbox/termbox2/archive/9c9281a9a4c971a2be57f8645e828ec99fd555e8.tar.gz"
  "cova-3fa729ccf582a4c818402019a579f1c5caf90fd3.tar.gz::https://github.com/00JCIV00/cova/archive/3fa729ccf582a4c818402019a579f1c5caf90fd3.tar.gz"
  "ghext-0.7.4.tar.gz::https://github.com/charlesrocket/ghext/archive/refs/tags/0.7.4.tar.gz"
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}?signed"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
b2sums=('d5cdf440d1ee51080fc2663867efe810645d4f6e8a352a15c79c99bde3bfe373923a8ba5ebd3a1d474f10b6468834e30e3b85dc34d03a27087ad6fc921fc3860'
        'e30beb7b62377e1c483004aef13a34e3aa387aa6f1c823ea1c81e4a43c4ba63392f44ef4a51055ad589f523ef2c3064bc186c6c61cd4764f7f0419c20b76d8ce'
        '3670b27a8033a4778001ae8a41f068c6e1d3a49916abe4b27ea132c44b451e66f9f8acda62c923078dc47102f3bf15c04afff77d9f9bf52448a92bfcacb705b8'
        'bb9daa4466f3bb987516da40fd66d8501aee124bf5b38b43ebaf56467227b4188fcdc1f2bc59d097bbbcbc13c4454c0593e3f317aca5c383aad310cd3397e625')
validpgpkeys=(
  '477763C3A2B941842775C21B9B495FD8CFBF4A1B' # -k <slowdive@me.com>
)

prepare() {
  cd "${srcdir}"
  for dep in "${_zigdepends[@]}"; do
    zig fetch --global-cache-dir "zig-global-cache" "${dep%%::*}"
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
    --system "${srcdir}/zig-global-cache/p"
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

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "build/usr/bin"
  install -vDm755 "${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
}
