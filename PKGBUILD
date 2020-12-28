# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git
# Contributor: Lone_Wolf <lone-wolf@klaas-de-kat.nl>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=openmw-mt-git
_name=openmw

pkgver=0.47.0.r24543.8c37817cf
_pkgver=0.47.0
pkgrel=1
pkgdesc="Open-source engine reimplementation for the role-playing game Morrowind, built with multithreaded physics support"
arch=('x86_64')
url="http://www.openmw.org"
license=('GPL3' 'MIT' 'custom')
depends=('openal' 'openscenegraph' 'mygui' 'bullet-multithreaded' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'boost-libs')
makedepends=('cmake' 'boost' 'doxygen' 'ninja' 'git')
provides=('openmw')
conflicts=('openmw')
source=('git+https://gitlab.com/OpenMW/openmw.git')
sha512sums=('SKIP')

pkgver() {
    cd $_name
    printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    # an adjustment of the example in wiki usable when upstream doesn't use tags (or neglects to maintain them)
}

build() {
    cmake \
        -B _build \
        -S "${srcdir}/${_name}"  \
        -G Ninja \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=Release \

    # CMAKE_BUILD_TYPE
    # RelWithDebInfo deviates substantially from archlinux standard and tends to give weird errors during building
    # None does comply with arch standards but deviates too far from what upstream expects
    # Release is a compromise between upstream settings and arch standard that works well (atleast for openmw)

    ninja  -C _build $NINJAFLAGS
    # NINJAFLAGS is an env var used to pass commandline options to ninja similar to MAKEFLAGS for make
    # NOTE: If unsure, don't set it.
  
}

package() {
  DESTDIR="${pkgdir}" ninja -C _build install
  install -Dm 644 "${_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
