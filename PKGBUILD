pkgname=igblast
pkgver=1.22.0
pkgrel=1
pkgdesc="NCBI IgBLAST: immunoglobulin and T-cell receptor sequence annotation"
arch=('x86_64')
url="https://www.ncbi.nlm.nih.gov/igblast/"
license=('Public Domain')
depends=('zlib' 'bzip2')
optdepends=('blast+: makeblastdb for formatting germline databases')
options=('!strip' '!debug')
source=("https://ftp.ncbi.nlm.nih.gov/blast/executables/igblast/release/${pkgver}/ncbi-igblast-${pkgver}-x64-linux.tar.gz")
sha256sums=('d54f1e1001fff529811c933595ef3c2322961c82b2d37a53f7a7914cd5807449')
_dir="ncbi-igblast-${pkgver}"

package() {
    cd "$srcdir/$_dir"
    # igblastn / igblastp only. makeblastdb & blastdbcmd are deliberately NOT
    # installed: they would collide with blast+ (which already provides them).
    install -Dm755 bin/igblastn "$pkgdir/usr/bin/igblastn"
    install -Dm755 bin/igblastp "$pkgdir/usr/bin/igblastp"

    # Helper scripts shipped alongside the binaries.
    install -Dm755 bin/edit_imgt_file.pl "$pkgdir/usr/bin/edit_imgt_file.pl"
    install -Dm755 bin/makeogrannote.py  "$pkgdir/usr/bin/makeogrannote.py"
    install -Dm755 bin/makeogrdb.py      "$pkgdir/usr/bin/makeogrdb.py"

    # Auxiliary data igblastn needs at runtime. By default igblastn looks for
    # internal_data/ next to the binary or in the cwd; point it here, e.g.
    #   igblastn -auxiliary_data /usr/share/igblast/optional_file/human_gl.aux ...
    install -d "$pkgdir/usr/share/$pkgname"
    cp -a internal_data optional_file "$pkgdir/usr/share/$pkgname/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
