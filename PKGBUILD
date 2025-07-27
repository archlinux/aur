# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname="rimsort-git"
pkgver=r1593.19e963a2
pkgrel=1
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
makedepends=(python patchelf git)
depends=(
    "python"
)
source=("git+https://github.com/RimSort/RimSort.git"
        "RimSort.desktop"
        "RimSort.sh")
sha512sums=('SKIP'
            'b12eaf50aa20f390fd01f71610c2993feac3fc835d49ee2ed0c3f650fcb86baeebaf50da38e0d649d9a715694662c27ea84f406ea6798eeaade67da21865c0a4'
            '090612cebedfc3bbeb2297b4863eaad2a6d9e4b1a52fe701acf0201e1d16736b7e9314af9436ab9c19e93c0656d551ed6fd210c963d2ba2f50721c93b69de793')

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
    source ENV/bin/activate
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
