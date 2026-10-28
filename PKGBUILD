# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>
# Source: https://github.com/jmelahman/pkgbuilds

pkgname=buildozer-bin
pkgver=10.2.0
pkgrel=1
pkgdesc='A command line tool to rewrite Bazel BUILD files using standard conventions'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
url='https://github.com/bazelbuild/buildtools'
conflicts=('buildozer')
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
sha256sums_x86_64=('0cfa2633184880ad5139bad3133fdf1a11ce3b7d37ba3eae9a85374a613c4779')
sha256sums_aarch64=('82bc376fafedd281579beb400be430d4c3f0104c1a8502d10e0cb7ec2c8cb5bd')

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
