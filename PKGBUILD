# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: orumin <dev@orum.in>
# Contributor: Adam <adam900710 at gmail dot com>

_basename=gst-libav
pkgname=lib32-gst-libav
pkgver=1.18.2
pkgrel=1
pkgdesc="Multimedia graph framework - libav plugin (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(GPL)
depends=(bzip2 lib32-gst-plugins-base-libs lib32-libffmpeg gst-libav)
makedepends=(python git meson)
provides=("lib32-gst-ffmpeg=$pkgver-$pkgrel")
_commit=20352236c2c22cd4b48d30c4218218e22e07ef77  # tags/1.18.2^0
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-libav.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd $_basename

    git describe --tags | sed 's/-/+/g'
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
        --libdir=lib32 \
        --libexecdir=lib32 \
        -D doc=disabled \
        -D package-name="GStreamer FFmpeg Plugin (Arch Linux)" \
        -D package-origin="https://www.archlinux.org/"

    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
