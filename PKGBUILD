# Maintainer: Swapnil Devesh <me@sidevesh.com>
# Contributor: Alireza S.N. <alireza6677@gmail.com>
# Based on libfprint-goodixtls-55x4 with host-side finger detection fix

pkgname="libfprint-goodixtls-55x4-fixed"
_pkgbase="libfprint-goodixtls-55x4"
pkgdesc="libfprint fork for goodixtls 55x4 devices with host-side finger detection fix (MCU FDT-down reply doesn't block on this firmware) and opencv5 build fix"
pkgver=r1804.d1ca62a
pkgrel=2
arch=('x86_64')
license=("LGPL2")
makedepends=("git" "meson" "pkgconf" "gobject-introspection" "gtk-doc" "doctest" "glib2-devel")
provides=("libfprint" "libfprint-2.so=2-64" "${_pkgbase}")
conflicts=("libfprint" "${_pkgbase}")
depends=('libgusb' 'openssl' 'pixman' 'nss' 'libgudev' 'opencv')
optdepends=('fprintd: D-Bus daemon for managing readers')
source=("${_pkgbase}::git+https://github.com/TheWeirdDev/libfprint.git"
        "0001-goodix55x4-host-side-finger-detect.patch"
        "0002-sigfm-opencv-pkgconfig-fallback.patch")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgbase}"
    mkdir -p build
    git switch '55b4-experimental'
    git pull -f origin 55b4-experimental
    patch -Np1 -i "${srcdir}/0001-goodix55x4-host-side-finger-detect.patch"
    patch -Np1 -i "${srcdir}/0002-sigfm-opencv-pkgconfig-fallback.patch"
}

build() {
    cd "${srcdir}/${_pkgbase}/build"
    meson ..
    meson configure --buildtype=release --prefix=/usr -D doc=false
    meson build ..
}

package() {
    cd "${srcdir}/${_pkgbase}/build"
    meson install --destdir="${pkgdir}"
}
