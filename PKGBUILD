pkgname=pandoc-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="https://pandoc.org"
license=("GPL2")
arch=('x86_64' 'aarch64')
conflicts=("pandoc" "pandoc-cli")
provides=("pandoc=$pkgver")
optdepends=('texlive-core: for pdf output')

# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-source-$pkgver.tar.gz::https://github.com/jgm/pandoc/archive/${pkgver}.tar.gz")
source_x86_64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("$pkgname-bin-$pkgver.tar.gz::https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux-arm64.tar.gz")

sha256sums=('7543c31e09ad8ccb2ce381c4039d76823865dc6c3922bfa2ed49367cf0e1fd3b')
sha256sums_x86_64=('4e1c607f7e4e9243fa1e1f5b208cd4f1d3f6fd055d5d8c39ba0cdc38644e1c35')
sha256sums_aarch64=('8ac04ce0aedae38f0c9f64bfe634910378cc326d091092395a2140a7ec819d54')

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
