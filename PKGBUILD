# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: orumin <dev@orum.in>
# Contributor: Adam <adam900710 at gmail dot com>

pkgname='lib32-gst-libav'
_basename="${pkgname#lib32-}"
pkgver=1.20.3
pkgrel=1
pkgdesc='Multimedia graph framework - libav plugin (32-bit)'
arch=('x86_64')
url='https://gstreamer.freedesktop.org/'
license=('GPL')
depends=(
    "lib32-gst-plugins-base-libs>=${pkgver}"
    'lib32-libffmpeg'
)
makedepends=(
    'cmake'
    'meson'
    'python'
)
provides=("lib32-gst-ffmpeg=${pkgver}")
_tardirname="${_basename}-${pkgver}"
source=("${url}src/${_basename}/${_tardirname}.tar.xz")
sha256sums=('3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe')

prepare() {
    # disable doc dir inclusion
    sed -e "s/\(subdir('docs')\)/#\1/" \
        -i "${_tardirname}/meson.build"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export CFLAGS+=" ${LDFLAGS}"    # otherwise meson (or the project) ignores LDFLAGS
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson "${_tardirname}" 'build' \
        --libdir='lib32' \
        --libexecdir='lib32' \
        -Ddoc='disabled' \
        -Dpackage-name="Arch Linux ${pkgname} ${pkgver}-${pkgrel}" \
        -Dpackage-origin='https://www.archlinux.org/'
}

build() {
    meson compile -C 'build'
}

check() {
    meson test -C 'build' --print-errorlogs
}

package() {
    # 64-bit lib not needed during build, only if package is installed, for shared header includes
    depends+=('gst-libav')

    meson install -C 'build' --destdir "${pkgdir}"
}
