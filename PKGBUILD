pkgname=pandoc-bin
pkgver=2.16
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

sha512sums=('c26ee9d53d3838b6bbdbae4eefaf011a8b2cc3f08cfb768c5d1174b5116c6a6c6222817b18de2a4c08621fcf14b9b57db1228d69072ef994dbcdefaa8421ccf2')
sha512sums_x86_64=('abd3461bdb9f35f8166decf5adfbc4324330f9713ce2bf1fece3b830f17dba6b1704658c9064b53f5bcdf5dffd5fd13679410253784e28212c0ecbbfa3a1115f')
sha512sums_aarch64=('cd59b1707fc50cbe28404ab87cfcf52953606dc8738999b4d1783bc58ac3992f9d0b079b0f4cdcedf3a76d7e14a24dc3a35e3b62c2e651eb67b72ebe29bb14ed')

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
