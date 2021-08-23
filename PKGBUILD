pkgname=pandoc-bin
pkgver=2.14.2
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

sha512sums=('2ea6528ed9e8b42111a6549acd80b6a8ca8fdc3628ee48f77cf730ba5b03d643956797a5755ded653ab7fc337a16e3d76cd9dbfb95f53124d74a4709c26842fe')
sha512sums_x86_64=('1412f387116fad8e6c50a82031d763929e5969de6e06eb7917f36244e836892af285eb11cd92d15ae8964baa424d0f49394d06701cb738a403355d0a625c6493')
sha512sums_aarch64=('e27bdf1b39359cb2fc46d10da97049134678007c6a6452083baf3e04a051813de9f265f3194e0d15f622609ae592d827863fac7c86b0ab7d00da4a66bf980e63')

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
