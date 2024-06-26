# Maintainer: Alireza S.N. <alireza6677@gmail.com>

arch=('x86_64')
pkgname="libfprint-goodixtls-55x4"
pkgdesc="libfprint fork for goodixtls 55x4 devices. Currently supports 55b4 but 55a4 will be added later. Note you will need to flash your device with [goodix-fp-dump](https://github.com/mpi3d/goodix-fp-dump) to use this"
makedepends=("git" "meson" "pkgconf" "gobject-introspection" "gtk-doc" "doctest" "glib2-devel")
license=("LGPL2")
provides=("libfprint" "libfprint-2.so=2-64")
conflicts=("libfprint")
source=("${pkgname}::git+https://github.com/TheWeirdDev/libfprint.git")
pkgrel=2
pkgver=r1802.6e4fdc0
md5sums=('SKIP')
depends=('libgusb' 'openssl' 'pixman' 'nss' 'libgudev' 'opencv')
optdepends=('fprintd: D-Bus daemon for managing readers')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    mkdir -p build
    git switch '55b4-experimental'
    git pull -f origin 55b4-experimental
}

build() {
    cd "${srcdir}/${pkgname}/build"
    meson ..
    meson configure --buildtype=release --prefix=/usr -D doc=false
    meson build ..
}

package() {
    cd "${srcdir}/${pkgname}/build"
    meson install --destdir="${pkgdir}"
}
