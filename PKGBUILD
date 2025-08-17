# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="anyzig"
pkgver=2025_08_13
_zig=0.14.0
pkgrel=1
pkgdesc="One zig to rule them all"
arch=('aarch64' 'armv7h' 'i686' 'powerpc64le' 'riscv64' 'x86_64')
url="https://github.com/marler8997/${pkgname}"
license=('custom:None')
# depends=('glibc')
makedepends=("zig>=${_zig}")
_pkgsrc="${pkgname}-${pkgver}"
_zig_deps=(
  # anyzig
  "zig-${_zig}.tar.gz::https://github.com/ziglang/zig/archive/refs/tags/${_zig}.tar.gz"
  "zipcmdline-3dfca786a489d117e4b72ea10ffb4bbd9fc2dd72.tar.gz::https://github.com/marler8997/zipcmdline/archive/3dfca786a489d117e4b72ea10ffb4bbd9fc2dd72.tar.gz"
)
# noextract=("${_zig_deps[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_zig_zon_hash.patch")
        #"${_zig_deps[@]}")
b2sums=('b8430605abf3558445a1c4934612c2309adb3ddb1c3ad7570c388bafc64c256d4deeb3c00025c9578eedfc43847d69e53bfcf2a9e375dfb7de4ba19458b79634'
        '5f333e648096431f12490e8cd750c260ff1f246e40ce701499751c5cd5ab8723f8ec68b1fcb469d7564948e09f105450669e33d878e1ba079d7a39485a481afd')
           
# prepare() {
#   cd "${srcdir}/${_pkgsrc}"
#   patch -Np1 -i "${srcdir}/${pkgname}_zig_zon_hash.patch"
# 
#   cd "${srcdir}"
#   for dep in "${_zig_deps[@]}"; do
#     zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
#   done
# }

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
  find "build" -type f ! -name 'zig' -delete
}

# tests require an internet connection and download huge files
# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr#
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="build" zig build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr/bin"
  mv -v zig "${pkgname}"
}
