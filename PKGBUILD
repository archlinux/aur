# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gst-plugins-ugly-git
pkgver=1.16.0.r16.g3cd445a4
pkgrel=1
pkgdesc='GStreamer Multimedia Framework Ugly Plugins (git version)'
arch=('x86_64')
url='https://gstreamer.freedesktop.org/'
license=('LGPL')
depends=(
    # official repositories:
        'libdvdread' 'libmpeg2' 'a52dec' 'libsidplay' 'libcdio'
        'x264' 'opencore-amr'
    # AUR:
        'gstreamer-git' 'gst-plugins-base-git'
)
makedepends=('git' 'meson' 'python' 'gtk-doc')
provides=("gst-plugins-ugly=${pkgver%%.r*}")
conflicts=('gst-plugins-ugly')
source=('git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-ugly.git'
        'gst-common'::'git+https://gitlab.freedesktop.org/gstreamer/common.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd gst-plugins-ugly

    git submodule init
    git config --local submodule.common.url "${srcdir}/gst-common"
    git submodule update
}

pkgver() {
    cd gst-plugins-ugly
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson gst-plugins-ugly build \
        -D gobject-cast-checks='disabled' \
        -D glib-asserts='disabled' \
        -D glib-checks='disabled' \
        -D doc='disabled' \
        -D package-name='GStreamer Ugly Plugins (Arch Linux)' \
        -D package-origin='https://www.archlinux.org/'
    ninja -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
