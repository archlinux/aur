pkgname=gnome-documents-git
_pkgname=gnome-documents
pkgver=3.34.0+7+g1baebf09
pkgrel=1
pkgdesc="A document manager application for GNOME"
url="https://wiki.gnome.org/Apps/Documents"
arch=(x86_64)
license=(GPL)
depends=('evince' 'gjs' 'gtk3' 'gnome-desktop' 'gnome-online-accounts' 'libgdata'
         'tracker-miners' 'libzapojit' 'webkit2gtk' 'gnome-online-miners' 'librsvg'
         'libgepub' 'gnome-epub-thumbnailer')
makedepends=('gobject-introspection' 'git' 'meson' 'yelp-tools' 'inkscape')
optdepends=('libreoffice-fresh: Support for Libreoffice document types')
provides=('gnome-documents')
conflicts=('gnome-documents')
source=("git+https://gitlab.gnome.org/GNOME/gnome-documents.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git submodule update
}
  

build() {
  arch-meson $_pkgname build -D getting_started=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
