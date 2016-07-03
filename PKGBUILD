# Maintainer: rafaelff <rafaelff@gnome.org>

pkgname=buzztrax
pkgver=0.10.2
pkgrel=1
pkgdesc="Modular music composer for Linux"
arch=(i686 x86_64)
url="http://buzztrax.org/"
license=(GPL FDL)
depends=(clutter-gtk fluidsynth gst-plugins-base-libs libgsf)
makedepends=(fluidsynth gobject-introspection intltool rarian gtk-doc)
#checkdepends=(valgrind check)
replaces=(buzztard)
optdepends=('gst-plugins-ugly: for the use of mp3 recording'
            'gst-plugins-bad: extra audio effects'
            'fluidsynth: to build a relates gstreamer wrapper')
source=("http://files.buzztrax.org/releases/buzztrax-$pkgver.tar.gz"
        "0001-tests-prefer-AM_TESTS_ENVIRONMENT-to-make-automake-h.patch")
md5sums=('c11472d7eae8501d5e2c1c2f4b590fdf'
         '31e372368e2ca1bbf0ea3721b5084f9b')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/0001-tests-prefer-AM_TESTS_ENVIRONMENT-to-make-automake-h.patch"
    sed -i 's/gtk-update-icon-cache-3.0/gtk-update-icon-cache/' configure.ac
}

build() {
    cd "$pkgname-$pkgver"
        
    autoreconf
    ./configure --prefix=/usr \
                --enable-man \
                --enable-gtk-doc \
                --disable-update-mime \
                --disable-update-desktop \
                --disable-update-icon-cache
    make
}

#check() {
#    cd "$pkgname-$pkgver"
#    make -k check
#}

package() {
    cd "$pkgname-$pkgver"
    make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}
