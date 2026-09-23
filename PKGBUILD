# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Yvaniak <ewen at philippot dot biz>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildifier-bin
pkgver=10.1.0
pkgrel=1
pkgdesc='A command line tool to format Bazel BUILD files'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
url='https://github.com/bazelbuild/buildtools'
conflicts=('buildifier')
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/bazelbuild/buildtools/v${pkgver}/LICENSE"
)
source_x86_64+=(
  "${pkgname}-x86_64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64"
)
source_aarch64+=(
  "${pkgname}-aarch64-${pkgver}::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-arm64"
)
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('31b6a8aa1e5c746696788f428729701770ad91925873d8256cb885c60e12c77e')
sha256sums_aarch64=('38d2ed845f560b4a16ddee41de906508a95f8dc85b04e0851b0a71e3a70d3890')

package() {
  cd "${srcdir}" || exit

  # Install the license file
  install -D -m 0644 \
    "${source[0]%%::*}" \
    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"

  # Install the binary
  install -D -m 0755 \
    "./${pkgname}-${CARCH}-${pkgver}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Upstream's release artefact is statically linked, so makepkg's own strip
  # step runs STRIP_STATIC (--strip-debug) over it and leaves .symtab behind.
  strip --strip-all "${pkgdir}/usr/bin/${pkgname%-bin}"
}
