# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>
# Contributor: Adam <adam900710@gmail.com>

_basename='gst-plugins-ugly'
pkgname="lib32-${_basename}"
pkgver=1.18.5
pkgrel=2
pkgdesc='Multimedia graph framework - ugly plugins (32-bit)'
url='https://gstreamer.freedesktop.org/'
arch=('x86_64')
license=('LGPL2.1')
depends=(
    "lib32-gst-plugins-base-libs>=${pkgver}"
    'lib32-a52dec'
    'lib32-libcdio'
    'lib32-libdvdread'
    'lib32-libmpeg2'
    'lib32-opencore-amr'
    'lib32-x264'
)
makedepends=(
    'git'
    'meson'
    'python'
)
_commit='bd1dfb44475ab04d42b217acdf90942e0b7893b5' # tags/1.18.5^0
source=("git+https://gitlab.freedesktop.org/gstreamer/${_basename}.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd "${_basename}"

    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd "${_basename}"
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson "${_basename}" 'build' \
        --libdir='lib32' \
        --libexecdir='lib32' \
        -Ddoc='disabled' \
        -Dsidplay='disabled' \
        -Dgobject-cast-checks='disabled' \
        -Dpackage-name='GStreamer Ugly Plugins (Arch Linux)' \
        -Dpackage-origin='https://www.archlinux.org/'

    meson compile -C 'build'
}

check() {
    meson test -C 'build' --print-errorlogs
}

package() {
    # 64-bit lib not needed during build, only if package is installed, for shared header includes
    depends+=("${_basename}>=${pkgver}")

    meson install -C 'build' --destdir "$pkgdir"

    rm -rf "${pkgdir}/usr/share"
}
