# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `libgtop` Maintainer: Jan de Groot <jgc@archlinux.org>

_pkgbase=libgtop
pkgname=mingw-w64-libgtop
pkgver=2.40.0
pkgrel=5
pkgdesc="A library for collecting system monitoring data"
url="https://gitlab.gnome.org/GNOME/libgtop"
arch=(x86_64)
license=(LGPL)
options=('!libtool' '!strip' '!buildflags' '!makeflags')
depends=(mingw-w64-glib2)
makedepends=(gobject-introspection git)
_commit=abccaf488a929de1e95e6a748485575dec52c998  # tags/2.40.0^0
source=("git+https://gitlab.gnome.org/GNOME/libgtop.git#commit=$_commit")
sha256sums=('SKIP')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

#pkgver() {
  #cd "${srcdir}"

  #for _arch in "${_architectures[@]}"; do
    #pushd "build-${_arch}"

    #git describe --tags | sed 's/-/+/g'

    #popd
  #done
#}

prepare() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    rm -rf build-${_arch}
    cp -r "${_pkgbase}" build-${_arch}
    pushd build-${_arch}

    NOCONFIGURE=1 ./autogen.sh

    popd
  done
}

build() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"

    ${_arch}-configure --prefix=/usr \
        --localstatedir=/var --disable-static .
    make

    popd
  done
}

package() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"

    make DESTDIR="$pkgdir" install

    popd
  done
}

