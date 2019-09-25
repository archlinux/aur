# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=aravis
pkgver=0.7.0
pkgrel=1
pkgdesc="A vision library for genicam-based cameras"
url="https://wiki.gnome.org/Projects/Aravis"
arch=('x86_64')
license=('LGPL2')
depends=('gtk3' 'libnotify' 'gst-plugins-base-libs' 'audit' 'libusb')
makedepends=('meson' 'gtk-doc' 'gobject-introspection' 'appstream-glib')
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('a399b2269328a3ad94d31f31fbdb8243dd81dd9c250dd73a4a2a5d405d9397fb')

prepare() {
    cd "$pkgname-$pkgver"
    # https://github.com/AravisProject/aravis/issues/297
    sed -i '/Exec=/s/arv-viewer$/arv-viewer-0.8/' viewer/data/arv-viewer.desktop.in.in
    # https://github.com/AravisProject/aravis/issues/298
    sed -i "/-DARAVIS_LOCALE_DIR/s/('prefix'),/& 'share', /" viewer/meson.build
}

build() {
    arch-meson $pkgname-$pkgver build
    ninja -C build
}

check() {
    ninja test -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
