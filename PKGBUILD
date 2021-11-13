# Maintainer: Jason Edson <jaysonedson@gmail.com>

_pkgname=meld
pkgname=$_pkgname-git
pkgver=3.21.0.216.g6e00779e
pkgrel=1
pkgdesc='Visual diff and merge tool'
url='http://meldmerge.org/'
license=(GPL)
arch=(any)
depends=(dconf
         glib2
         gsettings-desktop-schemas
         gtk3
         gtksourceview4
         python-cairo
         python-gobject)
makedepends=(git
             intltool
             meson
             yelp-tools)
optdepends=('python-dbus: open a new tab in an already running instance')
provides=('meld')
conflicts=('meld' 'meld-dev')
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/meld.git")
_merge_requests_to_use=('76')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd $_pkgname

    # Apply merge request 76 to fix launching Meld.
    # https://gitlab.gnome.org/GNOME/meld/-/merge_requests/76
    echo "Downloading and applying merge request 76..."
    curl -O "https://gitlab.gnome.org/GNOME/meld/-/merge_requests/76.diff"
    git apply 76.diff
}

build() {
    cd $srcdir
    arch-meson build $_pkgname -D byte-compile=false
    meson compile -C build
}

package() {
    cd $srcdir
    meson install -C build --destdir "$pkgdir"
}
