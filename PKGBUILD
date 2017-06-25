pkgname=pandoc-lite
pkgver=1.19.2.1
pkgrel=1
pkgdesc="Pandoc - executable only, without 750MB Haskell depends/makedepends"
url="http://pandoc.org"
license=("GPL")
arch=('x86_64')
conflicts=("pandoc")
provides=("pandoc=${pkgver}")
replaces=('pandoc-static')

source=(
    "https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-1-amd64.deb"

    # Note that they use a git submodule for data/templates, so soure tarballs from github are incomplete.
    # Fetching from hackage gets us a complete tarball without writing our own `git submodule` commands.
    "https://hackage.haskell.org/package/pandoc-${pkgver}/pandoc-${pkgver}.tar.gz"
)
sha256sums=(
    "db828cbab2a6d0d33f3754c4061a844ae2d1f0a01cbb12c512ef109117595dd2"
    "08692f3d77bf95bb9ba3407f7af26de7c23134e7efcdafad0bdaf9050e2c7801"
)

package() {
    cd "${srcdir}"

    # To avoid having to download over a gigabyte of haskell makedepends (400-ish for ghc, plus 750 in libs), we
    # just yoink the binary from static compiled binary distributed by pandoc:
    tar -zxf data.tar.gz
    cp -R usr "${pkgdir}/"

    # Citeproc is provided by a different package, and depends on various other datafiles we don't handle here.
    rm "${pkgdir}/usr/bin/pandoc-citeproc"
    rm "${pkgdir}/usr/share/man/man1/pandoc-citeproc.1.gz"
    rm -R "${pkgdir}/usr/share/doc/pandoc-citeproc"

    # We're still missing all the datafiles and so on. We get those from the source tarball...
    cd "pandoc-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/pandoc/"

    cp -R data "${pkgdir}/usr/share/pandoc/"
    cp COPYRIGHT "${pkgdir}/usr/share/pandoc/COPYRIGHT"
    cp MANUAL.txt "${pkgdir}/usr/share/pandoc/MANUAL.txt"
}
