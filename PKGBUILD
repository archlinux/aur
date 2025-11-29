# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname="rimsort-git"
pkgver=r2015.6548feb1
pkgrel=1
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
makedepends=(python git uv)
depends=(
    "python"
)
source=("git+https://github.com/RimSort/RimSort.git"
        "RimSort.desktop"
        "RimSort.sh")
sha512sums=('SKIP'
            'db841cbb8094361c99fe4f263221c1b6da5b16e1cf80badab1b60c23608d3f823eb55ee88eea2219ee2273941bdd1e49ea69f2724f379e96880c30ed4089149a'
            '59ef6734505a8888f341b179d781cb6096da1984d60f70c6362bc7c8eba8c5e6625ab6d85f999726c57c29a9fdb5953c682d3b63cf7d1e2d05b1e2513a9c9c3f')

OPTIONS=(!strip)

pkgver() {
    cd "$srcdir/RimSort"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/RimSort"
    uv sync --group build
    git submodule update --init --recursive
}

package() {
    cd "$srcdir/RimSort"

    # Main Files
    install -dm755 "$pkgdir/opt/rimsort/"
    cp -r .venv "$pkgdir/opt/rimsort/"
    cp -r submodules "$pkgdir/opt/rimsort/"
    cp -r app "$pkgdir/opt/rimsort/"
    cp -r themes "$pkgdir/opt/rimsort/"
    cp pyproject.toml "$pkgdir/opt/rimsort/"

    # Icon
    install -Dm644 "./themes/default-icons/AppIcon_a.png" "$pkgdir/usr/share/pixmaps/RimSort.png"

    # Desktop File
    install -Dm644 "$srcdir/RimSort.desktop" "$pkgdir/usr/share/applications/RimSort.desktop"

    # Launch Script
    install -Dm755 "$srcdir/RimSort.sh" "$pkgdir/usr/bin/RimSort"
}
