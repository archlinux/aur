# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall-git
_gitname=chwall
pkgver=v0.6.0.dev.99e8347
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("custom:WTFPL")
depends=("gdk-pixbuf2" "gobject-introspection-runtime" "gtk3"
         "hicolor-icon-theme" "procps-ng" "python" "python-cssselect"
         "python-gobject" "python-importlib-metadata" "python-lxml"
         "python-pillow" "python-requests" "python-setuptools" "python-xdg"
         "python-yaml")
makedepends=("imagemagick" "git")
optdepends=('imagemagick: to extract wallpaper size in nitrogen mode'
            'libnotify: to send notification when wallpaper change'
            'feh: to apply wallpaper on independant desktop manager'
            'xorg-xrandr: to extract screen config in nitrogen mode')
conflicts=("chwall")
source=("git+https://git.umaneti.net/${_gitname}/")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/${_gitname}"

    # Determine which is the last branch
    devbranch=$(git branch --sort=-committerdate --format "%(refname:short)" --list --remotes "origin/v*-dev" | head -n1)
    git checkout "${devbranch#origin/}"
}

pkgver() {
    cd "$srcdir/${_gitname}"

    hash=$(git show --format="%h" -s)
    branch=$(git branch --show-current | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
    echo "$branch.$hash"
}

package() {
    cd "$srcdir/${_gitname}"

    make dist DESTDIR="$pkgdir"
}
