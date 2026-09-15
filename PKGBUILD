# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Benjamin Denhartog <ben@sudoforge.com>

pkgname=buildozer-bin
pkgver=10.0.1
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
sha256sums_x86_64=('1dcd81b6e6d6fe2124f6196cd8d4288a1c12dda50fad7f1a01131c25498dac33')
sha256sums_aarch64=('a93fb409201b42e58074e192a0bc7e73787fb7d914bd8ad986f0f10b4f4ee3af')

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
