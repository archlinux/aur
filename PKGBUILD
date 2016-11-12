# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=pix
pkgver=1.2.0
pkgrel=1
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'librsvg'
        'gst-plugins-base-libs' 'gsettings-desktop-schemas' 'libwebp' 'webkit2gtk')
makedepends=('gnome-common' 'intltool' 'itstool' 'librsvg'
        'liboauth')
optdepends=('gstreamer: Video support'
    'exiv2: Embedded metadata support'
    'libjpeg-turbo: Jpeg writing support'
    'libtiff: Tiff writing support'
    'libopenraw: Support for RAW photos'
    'brasero: Burn discs'
    'liboauth: Web albums')
provides=($_pkgname)
conflicts=('pix-git')
url='https://github.com/linuxmint/pix'
install=pix.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('94d8a6476ca972d78ca819b6e6b4efe3')


build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}" \
        -disable-static

    # Copy some files that ended up in the wrong directory.
    # This doesn't happen on mint. See this github issue:
    # https://github.com/linuxmint/pix/issues/7
    if [ -d 'tests/$(top_srcdir)/' ]
    then
        cp 'tests/$(top_srcdir)/pix/.deps/dom_test-dom.Po' "pix/.deps/"
        cp 'tests/$(top_srcdir)/pix/.deps/glib_utils_test-glib-utils.Po' "pix/.deps/"
        cp 'tests/$(top_srcdir)/pix/.deps/gsignature_test-gsignature.Po' "pix/.deps/"
        cp 'tests/$(top_srcdir)/pix/.deps/oauth_test-gsignature.Po' "pix/.deps/"
    fi

    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

