# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-gtk-theme-git
_pkgname=Sweet
pkgver=r446.f5720cb
pkgrel=1
pkgdesc="A colorful dark GTK and KDE Plasma desktop theme"
arch=('any')
url="https://github.com/EliverLara/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=(
    'git'
    'inkscape'
    'optipng'
    'python'
)
optdepends=(
    'ttf-roboto: primary font used by the theme'
    'ttf-ubuntu-font-family: secondary font used by the theme'
)
conflicts=(
    'plasma5-themes-sweet-full-git'
    'sweet-gtk-theme-dark'
    'sweet-gtk-theme'
    'sweet-theme-git'
)
options=('!strip')
source=("$_pkgname::git+$url.git#branch=nova")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    export THEME_FONT_FACE=${THEME_FONT_FACE:-Roboto}
    export THEME_FONT_SIZE=${THEME_FONT_SIZE:-10}

    echo "To customize the font and size for gnome-shell, build this package"
    echo "with the variables below set to the desired font family and size"
    echo "- THEME_FONT_FACE (default font family is Roboto)"
    echo "- THEME_FONT_SIZE (default font point size is 10)"

    echo "Rendering gtk assets, please wait"

    # gtk-2.0 assets
    cd "$srcdir/$_pkgname/gtk-2.0"
    while IFS= read -r _; do echo -n "."; done < \
        <(./render-assets.sh 2>/dev/null); echo

    # gtk-3.0 assets
    cd "$srcdir/$_pkgname/src"
    while IFS= read -r _; do echo -n "."; done < \
        <(./render-gtk3-assets.py 2>/dev/null; \
        ./render-gtk3-assets-hidpi.py 2>/dev/null; \
        ./render-wm-assets-hidpi.py 2>/dev/null; \
        ./render-wm-assets.py 2>/dev/null); echo

    if [ "$THEME_FONT_FACE" != "Roboto" ]; then
        echo "Setting gnome-shell font face to $THEME_FONT_FACE"
        sed -i -re "s/font-family: (.*);/font-family: $THEME_FONT_FACE, \1;/" \
            "$srcdir/$_pkgname/gnome-shell/gnome-shell.css"
    fi

    if [ "$THEME_FONT_SIZE" != "10" ]; then
        echo "Setting gnome-shell font size to $THEME_FONT_SIZE"
        sed -i -re "s/font-size: (.*);/font-size: ${THEME_FONT_SIZE}pt;/" \
            "$srcdir/$_pkgname/gnome-shell/gnome-shell.css"
    fi

    echo "Done!"
}

package() {
    install -d "$pkgdir/usr/share/themes/Sweet"

    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/assets" "$srcdir/$_pkgname/assets"/*
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet" "$srcdir/$_pkgname/index.theme"

    cp -a "$srcdir/$_pkgname/cinnamon" "$pkgdir/usr/share/themes/Sweet/cinnamon"

    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gnome-shell" "$srcdir/$_pkgname/gnome-shell/gnome-shell.css"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gnome-shell/assets" "$srcdir/$_pkgname/gnome-shell/assets"/*

    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-2.0" "$srcdir/$_pkgname/gtk-2.0/gtkrc"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-2.0" "$srcdir/$_pkgname/gtk-2.0/main.rc"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-2.0/apps" "$srcdir/$_pkgname/gtk-2.0/apps"/*
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-2.0/assets" "$srcdir/$_pkgname/gtk-2.0/assets"/*

    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-3.0" "$srcdir/$_pkgname/gtk-3.0/gtk-dark.css"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-3.0" "$srcdir/$_pkgname/gtk-3.0/gtk.css"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-3.0" "$srcdir/$_pkgname/gtk-3.0/thumbnail.png"

    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-4.0" "$srcdir/$_pkgname/gtk-4.0/gtk-dark.css"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-4.0" "$srcdir/$_pkgname/gtk-4.0/gtk.css"
    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/gtk-4.0" "$srcdir/$_pkgname/gtk-4.0/thumbnail.png"

    install -Dm644 -t "$pkgdir/usr/share/themes/Sweet/metacity-1" "$srcdir/$_pkgname/metacity-1"/*

    cp -a "$srcdir/$_pkgname/xfwm4" "$pkgdir/usr/share/themes/Sweet/xfwm4"
}
