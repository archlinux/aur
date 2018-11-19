# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gst-plugins-ugly-git
_srcname=gst-plugins-ugly
pkgver=1.15.0.1.r5505.g59d43105
pkgrel=1
pkgdesc='GStreamer Multimedia Framework Ugly Plugins (git version)'
arch=('i686' 'x86_64')
url='https://gstreamer.freedesktop.org/'
license=('LGPL')
depends=(
    # official repositories:
        'libdvdread' 'libmpeg2' 'a52dec' 'libsidplay' 'libcdio'
        'x264' 'opencore-amr'
    # AUR:
        'gstreamer-git' 'gst-plugins-base-git'
)
makedepends=('git' 'python' 'gtk-doc' 'autoconf-archive')
provides=("gst-plugins-ugly=${pkgver%%.r*}")
conflicts=('gst-plugins-ugly')
source=('git+https://anongit.freedesktop.org/git/gstreamer/gst-plugins-ugly.git'
        'gst-common'::'git+https://anongit.freedesktop.org/git/gstreamer/common.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$_srcname"
    
    git submodule init
    git config --local submodule.common.url "${srcdir}/gst-common"
    git submodule update
    
    NOCONFIGURE='1' ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(grep 'AC_INIT' configure.ac | sed 's/,\[http.*//;s/AC_INIT.*\],//;s/.*\[\([^]]*\)\].*/\1/g')"
    _revision="$(git rev-list --count HEAD)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --localstatedir='/var' \
        --libexecdir='/usr/lib' \
        --enable-shared \
        --disable-static \
        --enable-experimental \
        --enable-gtk-doc \
        --with-package-name='GStreamer Ugly Plugins (Arch Linux)' \
        --with-package-origin='http://www.archlinux.org/'

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    
    make
}

check() {
    cd "$_srcname"
    
    make check
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
}
