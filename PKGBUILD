# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname="rimsort-git"
pkgver=r472.bcac961
pkgrel=1
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
makedepends=(python)
depends=(
    "python"
)
source=("git+https://github.com/RimSort/RimSort.git"
        "RimSort.desktop"
        "RimSort.sh")
sha512sums=('SKIP'
            '43aa5e5d28ec832f3a54434d66e4724c9a8fdde5098b2910911faf62a80823896a9b6d455dbe749150adf11e44126f6851bcd4cd937a3e00bb9b7f95699ca96e'
            'b737900aa332b202ae7cf48bd2f345b8e2af7fecaf0bd606768d26d8c632843b325f173f9c39879ef8ff0e1dafebd0bbdcb28d4be6d35c3532fba807b0ac86fd')

OPTIONS=(!strip)

pkgver() {
    cd "$srcdir/RimSort"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/RimSort"
    sed -i 's/PySide6<=6\.6\.2;/PySide6<=6.7.1;/g' requirements.txt
    python -m venv ENV
    source ENV/bin/activate
    pip install requests
}

build() {
    cd "$srcdir/RimSort"
    python distribute.py
}

package() {
    cd "$srcdir/RimSort/build/__main__.dist"

    # Main Files
    install -dm755 "$pkgdir/opt/rimsort/"
    cp -r ./* "$pkgdir/opt/rimsort/"

    # Icon
    install -Dm644 "./themes/default-icons/AppIcon_a.png" "$pkgdir/usr/share/pixmaps/RimSort.png"

    # Desktop File
    install -Dm644 "$srcdir/RimSort.desktop" "$pkgdir/usr/share/applications/RimSort.desktop"

    # Launch Script
    install -Dm755 "$srcdir/RimSort.sh" "$pkgdir/usr/bin/RimSort"
}
