pkgname=pandoc-bin
pkgver=2.16.1
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

sha512sums=('271cbee44924a8c16681516ab961b6921d1c22899750910cfed73f7293f24378ef16edb255e97044a4a00d8e9167c75e331f27839b739451387edfce1d012a42')
sha512sums_x86_64=('0bbe7a3165f8529d765d6f67dba5f84f38c6d26b7b536deaa011dd334bbe9350d5f4c465eeb30078507072007ba337dce09f158bd8d58c45eed5d490e81c81b2')
sha512sums_aarch64=('87beeab98d5d3f0b0e8c9e4fe929062d438bcefd5357e4caee0ee723b9302b140d917a96cbd6eb05890a7fa0c7ecfd976fbdd82dba6fceab5b4bd6ecdcd7092c')

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
