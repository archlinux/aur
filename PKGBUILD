# Maintainer: ItsZariep <itszariep@disroot.root>
pkgname=xed-coreplugins-c
pkgver=0.1
pkgrel=1
pkgdesc="Xed plugins: textsize, joinlines and bracketcompletion rewritten in C (fixing libpeas problems)"
arch=('any')
url="https://codeberg.org/ItsZariep/xed-coreplugins-c"
license=('GPL')
depends=('xed')
makedepends=('meson' 'ninja' 'pkgconf' 'glib2')
source=("git+https://codeberg.org/ItsZariep/xed-coreplugins-c#branch=main"
"changes.diff")
sha256sums=('SKIP' 'ffc40ee0fd1ecf5860a9b38ff94c31a5893657e3588987511088deb1a44b5323')

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 < "$srcdir/changes.diff"
}

build() {
    cd "$srcdir/$pkgname/src"
    meson setup build --prefix=/usr
    meson compile -C build
}

package() {
    cd "$srcdir/$pkgname/src"

    meson install -C build --destdir="$pkgdir"

    cd $pkgdir/usr/lib/xed/plugins/
    for file in ./*.so ./*.plugin; do
        [ -e "$file" ] || continue
        base=$(basename "$file")
        newname="${base%.*}-c.${base##*.}"
        mv "$file" "$pkgdir/usr/lib/xed/plugins/$newname"
    done
}
