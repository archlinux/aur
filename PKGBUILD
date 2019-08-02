# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=pix-git
_pkgbasename=pix
pkgver=1.6.2.r0.gceadb95
pkgrel=1
pkgdesc="Image viewer and browser based on gthumb. X-Apps Project (git version)."
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'librsvg' 'clutter-gtk'
        'gst-plugins-base-libs' 'gsettings-desktop-schemas' 'libwebp' 'webkit2gtk')
makedepends=('git' 'gnome-common' 'intltool' 'itstool'
        'liboauth' 'libchamplain' 'libopenraw' 'exiv2' )
optdepends=('gstreamer: Video support'
    'exiv2: Embedded metadata support'
    'libjpeg-turbo: Jpeg writing support'
    'libtiff: Tiff writing support'
    'dcraw: Support for RAW photos'
    'brasero: Burn discs'
    'liboauth: Web albums'
    'libchamplain: Map Viewer')
provides=($pkgname $_pkgbasename)
conflicts=(${_pkgbasename})
url='https://github.com/linuxmint/pix'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${pkgname}
    gnome-autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/pix" \
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
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
}

