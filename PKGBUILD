pkgname=pandoc-bin
pkgver=2.17.0.1
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="https://pandoc.org"
license=("GPLv2+")
arch=('x86_64' 'aarch64')
conflicts=("pandoc")
provides=("pandoc")
replaces=('pandoc-static' 'pandoc-lite')
optdepends=('texlive-core: for pdf output')

# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-source-$pkgver.tar.gz::https://github.com/jgm/pandoc/archive/${pkgver}.tar.gz")
source_x86_64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-arm64.tar.gz")

sha512sums=('b47049b5b74754b66895841fbb3c0fafde8cedb9349d03b58b4895128bdc884ea3d80fc35232d93bac78567dcab672819f923400454c6797e936938c04478eb7')
sha512sums_x86_64=('a1b0dd01c5f6f8e418dea2cbd763f9360d375380f38922905f9fbbb0aaed92bd6ab6091e3f28b7046aaceac4a7099543d47bae31f0696967a1eaaca908274e8d')
sha512sums_aarch64=('cd25a2409e5fee2dfab5c5f7b30271958bfddd334f9793624220d99b61d54122784f72176c3697cd6886f6adbe5eb803cfebfd1690acabe63caa335a4919cad9')

package() {
  cd "${srcdir}/pandoc-${pkgver}"

  # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
  # just yoink the binary from static compiled binary distributed by pandoc:
  mkdir -p "${pkgdir}/usr/share/pandoc"
  cp -R bin share "${pkgdir}/usr"

  # We're still missing all the datafiles and so on. We get those from the source tarball...
  cp -R data "${pkgdir}/usr/share/pandoc/"
  cp COPYRIGHT MANUAL.txt "${pkgdir}/usr/share/pandoc/"
}
