pkgname=pandoc-bin
pkgver=2.16.2
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

sha512sums=('b682efb0d2725744906449a84f6cec8f28ab4f0f667e6ff85300220b1130970be88d341a5791d0f49131091420b22b772e9ed4387d1f4adcc5c9ca70ade65512')
sha512sums_x86_64=('6560fbdc73a186cbbe5e45c37449f9418cf9331a5ae8467f0e514e3c25721816f3f25632b559db5f9be7369dea2ea9943601399c9b2040fd7bf0132fe5694a31')
sha512sums_aarch64=('dc959368dd2f40edb85d19787839822b04cb5d0554e5c47dde2231eef7c9c318ce229a4082ceb23df1ab9f4ce28695a6ba7596962dacfa33289e5e10536c0983')

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
