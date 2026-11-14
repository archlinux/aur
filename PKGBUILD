# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=zig
pkgbase="anyzig"
pkgname=(
  "${pkgbase}-common"
  "${pkgbase}"
  "anyzls"
)
pkgver=2026_11_12
pkgrel=1
pkgdesc="One zig to rule them all"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://marler8997.github.io/anyzig/"
_url="https://github.com/marler8997/${pkgbase}"
license=(
  'MIT'
)
makedepends=(
  "zig>=0.17"
  # "zig${_zig}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('1dcc373b03a19fe75554ff91d6ab9fe41586ff6041ed9c5bde8a076f9479633fb10c405c20e8a76f8cfe5db62e148bc00b62c47534c6586da528287b46458a9f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i '/const zls = blk:/,/const run = b.addRunArtifact(exe)/{
      /const install = b.addInstallArtifact(exe, .{});/a\
          b.getInstallStep().dependOn(\&install.step);
  }' build.zig
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  # DESTDIR="build" "${_zig}" build release "${zig_options[@]}"
  DESTDIR="build" "${_zig}" build "${zig_options[@]}"
}

# tests require an internet connection and download huge files
# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr#
#     # --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.42
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "${_zig}" build test "${zig_options[@]}"
# }

package_anyzig-common() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )
  conflicts=(
    "${pkgbase}<2026_10_23"
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_anyzig() {
  depends=(
    "${pkgbase}-common>=${pkgver}-${pkgrel}"
  )

  cd "${srcdir}/${_pkgsrc}/build/usr/bin"
  install -vDm755 "${pkgname#any}" "${pkgdir}/usr/bin/${pkgname}"
}

package_anyzls() {
  pkgdesc+=" (ZLS)"
  depends=(
    "${pkgbase}-common>=${pkgver}-${pkgrel}"
  )

  cd "${srcdir}/${_pkgsrc}/build/usr/bin"
  install -vDm755 "${pkgname#any}" "${pkgdir}/usr/bin/${pkgname}"
}
