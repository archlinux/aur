# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgbase=juno-mirage-standard-buttons-theme-git
__pkgname="${pkgbase%-theme-git}"
__Pkgname="${__pkgname^}"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
pkgname=(
    "$__pkgname-gtk-theme-git"
)
pkgver=r156.11dd089
pkgrel=1
pkgdesc="GTK themes inspired by epic vscode themes"
arch=("any")
url="https://github.com/EliverLara/Juno"
license=("GPL3")
makedepends=("git" "inkscape" "optipng")
optdepends=(
    "ttf-roboto: default font for gnome-shell"
    "gtk-engine-murrine: GTK2 support"
    "gnome-themes-extra: GTK2 support"
)
source=("$__pkgname::git+$url.git#branch=${__pkgname#juno-}")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/$__pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$__pkgname"

    export THEME_FONT_FACE="${THEME_FONT_FACE:-Roboto}"
    export THEME_FONT_SIZE="${THEME_FONT_SIZE:-10}"
    msg2 "To customize the font and size for gnome-shell, build this package"
    msg2 "with the variables below set to the desired font family and size"
    msg2 "- THEME_FONT_FACE (default font family is Roboto)"
    msg2 "- THEME_FONT_SIZE (default font point size is 10)"
    msg2 ""
    msg2 "Setting gnome-shell font face to $THEME_FONT_FACE"
    msg2 "Setting gnome-shell font size to $THEME_FONT_SIZE"

    if [ "$THEME_FONT_FACE" != "Roboto" ]; then
        sed -i -re "s/font-family: (.*);/font-family: $THEME_FONT_FACE, \1;/" \
            "$srcdir/$__pkgname/gnome-shell/gnome-shell.css"
    fi
    if [ "$THEME_FONT_SIZE" != "10" ]; then
        sed -i -re "s/font-size: (.*);/font-size: ${THEME_FONT_SIZE}pt;/" \
            "$srcdir/$__pkgname/gnome-shell/gnome-shell.css"
    fi

    msg2 "Rendering assets, please wait"
    pushd gtk-2.0
    while read $line; do echo -n "."; done < \
        <(./render-assets.sh 2>/dev/null)
    echo
    popd

    pushd src
    while read $line; do echo -n "."; done < \
        <(
            ./render-gtk3-assets.py 2>/dev/null
            ./render-gtk3-assets-hidpi.py 2>/dev/null
            ./render-wm-assets-hidpi.py 2>/dev/null
            ./render-wm-assets.py 2>/dev/null
        )
    echo
    popd
    msg2 "Done!"
}

package_juno-mirage-standard-buttons-gtk-theme-git() {
    provides=("${pkgname[0]%-git}")
    conflicts=("${pkgname[0]%-git}" "${pkgbase%-git}")

    mkdir -p "$pkgdir/usr/share/themes"
    cp -a "$srcdir/$__pkgname" "$pkgdir/usr/share/themes/$__Pkgname"
    cd "$pkgdir/usr/share/themes/$__Pkgname"
    rm -r ".git"* "Art/" "kde/" "src/" *".json" "Gulpfile.js"
}
