# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gst-plugins-ugly-git
pkgver=1.13.0.1.r5421.g6b03e61b
pkgrel=1
pkgdesc='GStreamer Multimedia Framework Ugly Plugins (git version)'
arch=('i686' 'x86_64')
url='https://gstreamer.freedesktop.org/'
license=('LGPL')
depends=(
    # official repositories:
        'libdvdread' 'lame' 'libmpeg2' 'a52dec' 'libsidplay' 'libcdio'
        'libx264' 'libx264-all' 'opencore-amr' 'mpg123'
    # AUR:
        'gstreamer-git' 'gst-plugins-base-git'
)
makedepends=('git' 'python' 'gtk-doc' 'x264' 'autoconf-archive' 'valgrind')
provides=("gst-plugins-ugly=${pkgver%%.r*}")
conflicts=('gst-plugins-ugly')
source=(
                "$pkgname"::'git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly'
    'submodule-gst-common'::'git://anongit.freedesktop.org/gstreamer/common'
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$pkgname"
    
    git submodule init
    git config --local submodule.common.url "${srcdir}/submodule-gst-common"
    git submodule update
}

pkgver() {
    cd "$pkgname"
    
    local _version="$(grep 'AC_INIT' configure.ac | sed 's/,\[http.*//;s/AC_INIT.*\],//;s/.*\[\([^]]*\)\].*/\1/g')"
    local _revision="$(git rev-list --count HEAD)"
    local _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$pkgname"
    
    NOCONFIGURE=1 ./autogen.sh
    
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
        --with-package-origin='http://www.archlinux.org/' \
        --with-x264-libraries='/usr/lib/x264/libx264-8bit.so:/usr/lib/x264/libx264-10bit.so'

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    
    make
}

# uncomment this block to enable checks
#check() {
#    cd "$pkgname"
#    make check
#}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
