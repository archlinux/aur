# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname="rimsort-git"
pkgver=r2084.33b70b7c
pkgrel=1
pkgdesc="A Mod Manager For Rimworld game"
arch=("x86_64")
url="https://github.com/RimSort/RimSort"
license=("GPL3")
makedepends=(git)
depends=(python uv)
source=("git+https://github.com/RimSort/RimSort.git"
        "RimSort.desktop"
        "RimSort.sh")
sha512sums=('SKIP'
            '0af6eabe1f2a5ff07b299d77e1ef878d368229e39bd4488831831de98ed5ef2d911f70bd5b9f82f8d9b2a788a0e339c99d7772b4b3f0880d114b0da2a252b0f1'
            '59ef6734505a8888f341b179d781cb6096da1984d60f70c6362bc7c8eba8c5e6625ab6d85f999726c57c29a9fdb5953c682d3b63cf7d1e2d05b1e2513a9c9c3f')

OPTIONS=(!strip)

pkgver() {
    cd "$srcdir/RimSort"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/RimSort"
    rm -rf .venv
    uv sync --group build
    git submodule update --init --recursive
}

package() {
    cd "$srcdir/RimSort"

    # Force .venv to not depend on local python
    target=$(readlink ".venv/bin/python")
    targetDir=$(dirname "$target")
    targetLib="$targetDir/../lib"
    cp -r "$targetLib"/* .venv/lib
    cp --remove-destination "$(readlink ".venv/bin/python")" ".venv/bin/python"

    # Main Files
    install -dm755 "$pkgdir/opt/rimsort/"
    cp -r .venv "$pkgdir/opt/rimsort/"
    cp -r submodules "$pkgdir/opt/rimsort/"
    cp -r app "$pkgdir/opt/rimsort/"
    cp -r themes "$pkgdir/opt/rimsort/"
    cp pyproject.toml "$pkgdir/opt/rimsort/"
    mkdir "$pkgdir/opt/rimsort/libs"
    cp -r libs/*.so "$pkgdir/opt/rimsort/libs/"
    cp steam_appid.txt "$pkgdir/opt/rimsort/"

    # Add missing steam symlink
    ln -s SteamworksPy_x86_64.so "$pkgdir/opt/rimsort/libs/SteamworksPy.so"

    # Icon
    install -Dm644 "./themes/default-icons/AppIcon_a.png" "$pkgdir/usr/share/pixmaps/RimSort.png"

    # Desktop File
    install -Dm644 "$srcdir/RimSort.desktop" "$pkgdir/usr/share/applications/RimSort.desktop"

    # Launch Script
    install -Dm755 "$srcdir/RimSort.sh" "$pkgdir/usr/bin/RimSort"
}
