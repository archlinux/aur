# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname="rimsort-git"
pkgver=r1638.e4c49856
pkgrel=1
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
makedepends=(python patchelf git uv)
depends=(
    "python"
)
source=("git+https://github.com/RimSort/RimSort.git"
        "gcc-wrapper.sh"
        "RimSort.desktop"
        "RimSort.sh")
sha512sums=('SKIP'
            'cd23307d2f03a87e9a2c892193fa30294278d480ba1674ccf4813d0ff07daf8d06e3ea026fddccebe000b21603502c260e39b2617690e4031dd5672f43154190'
            'b12eaf50aa20f390fd01f71610c2993feac3fc835d49ee2ed0c3f650fcb86baeebaf50da38e0d649d9a715694662c27ea84f406ea6798eeaade67da21865c0a4'
            '090612cebedfc3bbeb2297b4863eaad2a6d9e4b1a52fe701acf0201e1d16736b7e9314af9436ab9c19e93c0656d551ed6fd210c963d2ba2f50721c93b69de793')

OPTIONS=(!strip)

pkgver() {
    cd "$srcdir/RimSort"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/RimSort"
    uv sync --group build
    export CC="$srcdir/gcc-wrapper.sh"
    uv run python distribute.py
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
