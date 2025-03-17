# Maintainer : Hauke Ingwersen <hauing@pm.me>
# Contributor: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=48.0
_milestone="${pkgver%%.*}"
pkgrel=1
pkgdesc="Document viewer, no gnome dependencies"
url="https://wiki.gnome.org/Apps/Evince"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'libgxps' 'libspectre' 'gsfonts' 'poppler-glib' 'djvulibre' 't1lib' 'dconf' 'libsynctex' 'gsettings-desktop-schemas' 'libarchive' 'gst-plugins-base-libs' 'gspell' 'libhandy')
makedepends=('texlive-bin' 'docbook-xsl' 'python' 'git' 'meson' 'ninja' 'appstream-glib' 'yelp-tools' 'glib2-devel')
optdepends=('texlive-bin: DVI support'
            'gvfs: for session saving and bookmarking')
provides=("$_pkgname" libev{document,view}3.so)
conflicts=("$_pkgname" libev{document,view}3.so)
options=('!emptydirs')
source=("https://download.gnome.org/sources/evince/${_milestone}/evince-${pkgver}.tar.xz")
sha256sums=('cd2f658355fa9075fdf9e5b44aa0af3a7e0928c55614eb1042b36176cf451126')

prepare () {
    tar -xvf evince-${pkgver}.tar.xz
}

build() {
    arch-meson "$srcdir/evince-${pkgver}" build \
        -D ps=enabled \
        -D nautilus=false \
        -D introspection=false \
        -D thumbnail_cache=disabled \
        -D keyring=disabled \
        -D gtk_doc=false
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"
}
