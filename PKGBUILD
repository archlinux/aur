# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>
# Contributor: Adam <adam900710@gmail.com>

_basename='gst-plugins-ugly'
pkgname="lib32-${_basename}"
pkgver=1.20.3
pkgrel=2
pkgdesc='Multimedia graph framework - ugly plugins (32-bit)'
url='https://gstreamer.freedesktop.org/'
arch=('x86_64')
license=('GPL')
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
    'cmake'
    'meson'
)
source=("${url}src/${_basename}/${_basename}-${pkgver}.tar.xz")
sha256sums=('8caa20789a09c304b49cf563d33cca9421b1875b84fcc187e4a385fa01d6aefd')

prepare() {
    # disable doc dir inclusion and Python module import (latter is not needed for release version)
    sed -e 's/python3/#python3/' \
        -e "s/\(subdir('docs')\)/#\1/" \
        -i "${_basename}-${pkgver}/meson.build"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export CFLAGS+=" ${LDFLAGS}"    # otherwise meson (or the project) ignores LDFLAGS
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson "${_basename}-${pkgver}" 'build' \
        --libdir='lib32' \
        --libexecdir='lib32' \
        -Ddoc='disabled' \
        -Dgpl='enabled' \
        -Dsidplay='disabled' \
        -Dgobject-cast-checks='disabled' \
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
    depends+=("${_basename}>=${pkgver}")

    meson install -C 'build' --destdir "${pkgdir}"

    rm -rf "${pkgdir}/usr/share"
}
