# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=buzztrax
pkgver=0.10.2
pkgrel=1
pkgdesc="Modular music composer for Linux"
arch=('x86_64')
url="http://buzztrax.org/"
license=('GPL' 'FDL')
depends=('clutter-gtk' 'fluidsynth' 'gst-plugins-base-libs' 'libgsf')
makedepends=('fluidsynth' 'gobject-introspection' 'intltool' 'rarian' 'gtk-doc')
replaces=('buzztard')
optdepends=('gst-plugins-ugly: for the use of mp3 recording'
            'gst-plugins-bad: extra audio effects'
            'fluidsynth: to build a relates gstreamer wrapper')
source=("http://files.buzztrax.org/releases/buzztrax-$pkgver.tar.gz"
        "0001-tests-prefer-AM_TESTS_ENVIRONMENT-to-make-automake-h.patch")
sha256sums=('675ed744cd5209dda11e1d2fcd621d6ca23bf2eac89230bbd39242fe5f4000ed'
            '7866edce48a9b7375ae0c38b9dc8565ecac80dc8ad31e772a8d178f487f8f136')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/0001-tests-prefer-AM_TESTS_ENVIRONMENT-to-make-automake-h.patch"
    sed -i 's/gtk-update-icon-cache-3.0/gtk-update-icon-cache/' configure.ac
    autoreconf
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-man --enable-gtk-doc \
                --disable-update-{mime,desktop,icon-cache}
    make
}

package() {
    cd "$pkgname-$pkgver"
    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
