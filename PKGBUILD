pkgname=pandoc-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="http://pandoc.org"
license=("GPL")
arch=('x86_64')
conflicts=("pandoc")
provides=("pandoc")
replaces=('pandoc-static' 'pandoc-lite')
depends=('cmark')
optdepends=(
    'pandoc-citeproc-bin: for citation rendering with pandoc-citeproc filter'
    'pandoc-crossref-bin: for numbering figures, equations, tables and cross-references to them with pandoc-crossref filter'
    'texlive-core: for pdf output'
)

source=(
    "https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux.tar.gz"

    # The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
    "https://github.com/jgm/pandoc/archive/${pkgver}.tar.gz"
)
sha256sums=('829f7022b6bf5164ad5aabb88ad18d432e2ed15b11625d14ca76eee476c16a2d'
            'b6a5bcd42ccd2387b959db7abaa4d3943d73c3e16d42e3d9e944b61acd2912e4')

package() {
    cd "${srcdir}/pandoc-${pkgver}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    mkdir -p "${pkgdir}/usr/share/pandoc"
    cp -R bin share "${pkgdir}/usr"

    # Citeproc is provided by a different package, and depends on various other datafiles we don't handle here.
    rm "${pkgdir}/usr/bin/pandoc-citeproc" "${pkgdir}/usr/share/man/man1/pandoc-citeproc.1.gz"

    # We're still missing all the datafiles and so on. We get those from the source tarball...
    cp -R data "${pkgdir}/usr/share/pandoc/"
    cp COPYRIGHT MANUAL.txt "${pkgdir}/usr/share/pandoc/"

    # When pandoc stopped having templates as a submodule, they copied various github turds into their source
    # tree, so let's tidy that up...
    rm -R ${pkgdir}/usr/share/pandoc/data/templates/{.github,README.markdown}
}
