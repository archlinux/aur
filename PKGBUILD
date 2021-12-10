# Maintainer: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=41.3
pkgrel=1
pkgdesc="Document viewer, no gnome dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'libgxps' 'libspectre' 'gsfonts' 'poppler-glib' 'djvulibre' 't1lib' 'dconf' 'libsynctex' 'gsettings-desktop-schemas' 'libarchive' 'gst-plugins-base-libs' 'gspell' 'libhandy')
makedepends=('texlive-bin' 'docbook-xsl' 'python' 'gtk-doc' 'git' 'meson' 'ninja' 'appstream-glib' yelp-tools)
optdepends=('texlive-bin: DVI support'
            'gvfs: for session saving and bookmarking')
provides=("$_pkgname" libev{document,view}3.so)
conflicts=("$_pkgname" libev{document,view}3.so)
options=('!emptydirs')
_commit=08780f527ac0306f527c48ea6cc77a7b2c6c5fa8  # tags/41.3^0
source=("git+https://gitlab.gnome.org/GNOME/evince.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
    arch-meson "$_pkgname" build \
        -D ps=enabled \
        -D nautilus=false \
        -D introspection=false \
        -D browser_plugin=false \
        -D thumbnail_cache=disabled \
        -D keyring=disabled
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
