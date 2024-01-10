# Maintainer: Mark Waddoups <mwaddoups@gmail.com>
pkgname=stata
pkgver=18
pkgrel=1
pkgdesc="A high-level statistical language used in econometrics and statistics."
arch=(x86_64)
url="https://www.stata.com/"
license=(custom)
depends=(ncurses5-compat-libs libpng12)
source=(local://Stata18Linux64.tar.gz local://stata_lic.sh)
md5sums=(43e05d773b20a8e372d3c7e3abb54b40 SKIP)

prepare() {
    cd "$srcdir"
    # Replace input for answer with default Yes (noninteractive)
    sed -i 's/Answer$/ANSW=y/g' install
}

package() {
    # Install files to /usr/local
    mkdir -p "$pkgdir/usr/local/stata"
    cd "$pkgdir/usr/local/stata"
    echo "Installing stata (output in src/install.log)..."
    /$srcdir/install > $srcdir/install.log

    # Run the license script
    echo "Licensing stata (output in src/license.log)."
    echo "If this crashes, check the log and make sure you've read README.md and entered license information..."
    echo "If this takes a long time, you may need to debug this script..."
    bash $srcdir/stata_lic.sh > $srcdir/license.log

    # Symbolic links for path
    mkdir -p "$pkgdir/usr/local/bin"
    ln -s "/usr/local/stata/stata" "$pkgdir/usr/local/bin/stata"
    ln -s "/usr/local/stata/xstata" "$pkgdir/usr/local/bin/xstata"
    ln -s "/usr/local/stata/stata-se" "$pkgdir/usr/local/bin/stata"
    ln -s "/usr/local/stata/xstata-se" "$pkgdir/usr/local/bin/xstata"
    ln -s "/usr/local/stata/stata-mp" "$pkgdir/usr/local/bin/stata"
    ln -s "/usr/local/stata/xstata-mp" "$pkgdir/usr/local/bin/xstata"

}
