pkgname=gnome-books-git
_pkgname=gnome-books
pkgver=3.34.0+17+gebf83fde
pkgrel=1
pkgdesc="Access and organize your e-books on GNOME"
url="https://wiki.gnome.org/Apps/Books"
arch=(x86_64)
license=(GPL)
depends=('evince' 'gjs' 'gtk3' 'gnome-desktop' 'tracker-miners' 'webkit2gtk' 'libgepub'
         'gnome-epub-thumbnailer')
makedepends=('gobject-introspection' 'git' 'meson' 'yelp-tools')
provides=('gnome-books')
conflicts=('gnome-books')
groups=('gnome')
source=("git+https://gitlab.gnome.org/GNOME/gnome-books.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.subprojects/libgd.url "$srcdir/libgd"
  git submodule update
}
  

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
