# Maintainer : Hauke Ingwersen <hauing@pm.me>
# Contributor: Yiyao Yu <yyudevel at protonmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=evince-no-gnome
_pkgname=evince
pkgver=46.3.1
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
sha256sums=('945c20a6f23839b0d5332729171458e90680da8264e99c6f9f41c219c7eeee7c')

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
