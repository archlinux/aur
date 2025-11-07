# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall-git
_gitname=chwall
pkgver=v0.7.3.dev.c52626b
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("LicenseRef-WTFPL")
depends=("gdk-pixbuf2" "gobject-introspection-runtime" "gtk3"
         "hicolor-icon-theme" "procps-ng" "python" "python-cssselect"
         "python-gobject" "python-importlib-metadata" "python-lxml"
         "python-pillow" "python-pyxdg" "python-requests" "python-yaml")
makedepends=("git" "graphicsmagick" "python-build" "python-installer"
             "python-setuptools" "python-wheel")
optdepends=("feh: to apply wallpaper on independant desktop manager"
            "graphicsmagick: to extract wallpaper size when using feh"
            "libappindicator: to display a tray icon"
            "libnotify: to send notification when wallpaper change"
            "xorg-xrandr: to extract screen config when using feh")
conflicts=("chwall")
source=("git+https://git.umaneti.net/${_gitname}/")
md5sums=("SKIP")
options=(!debug)

prepare() {
    cd "${_gitname}"

    # Determine which is the last branch
    devbranch=$(git branch --sort=-committerdate --format "%(refname:short)" --list --remotes "origin/v*-dev" | head -n1)
    git checkout "${devbranch#origin/}"
}

pkgver() {
    cd "${_gitname}"

    hash=$(git show --format="%h" -s)
    branch=$(git branch --show-current | sed "s/\([^-]*-g\)/r\1/;s/-/./g")
    echo "$branch.$hash"
}

check() {
    cd "${_gitname}"
    make test
}

build() {
    cd "${_gitname}"
    make build DESTDIR="$pkgdir" CHWALL_NATIVE_PATH=yes
}

package() {
    cd "${_gitname}"
    make package DESTDIR="$pkgdir"

    cd "$pkgdir/usr/share/licenses"
    mv chwall chwall-git
}
