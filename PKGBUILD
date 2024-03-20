# Maintainer: Camille 'DrasLorus' Monière <draslorus at draslorus dot fr>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
# Contributor: Alexander Rødseth <rodseth at gmail dot com>
# Contributor: William Rea <sillywilly at gmail dot com>

# Based on commit c1b9bad65f1e490ed8bb02133074c1412aec9f71 of libmatio-git 

_pkgname=mingw-w64-libmatio
pkgname=mingw-w64-libmatio-git
pkgver=1.5.26.41.gaed031f
pkgrel=1
pkgdesc='C library with a fortran 90/95 module interface for reading/writing MATLAB MAT-files (git version, mingw-64)'
arch=('any')
license=('custom:BSD')
url='https://github.com/tbeu/matio'
depends=('mingw-w64-zlib' 'mingw-w64-hdf5' 'mingw-w64-crt')
makedepends=('git' 'mingw-w64-configure')
options=('!libtool' '!emptydirs' '!strip' 'staticlibs' '!buildflags')
source=("${_pkgname}::git+${url}.git"
	"assume_c99_va_copy.patch"
	"fix_Win32_header.patch")
sha256sums=('SKIP'
            '8bc2a8b2eacd7fc714eaa420db0c714b1677f0f4ff3663655ed05cdf5764a767'
            '140017ff79b7fe3c2cece0f7eaddcecd5841684fb8b7aa21b7eca4a580caf3ef')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 < ../../assume_c99_va_copy.patch
    patch -p1 < ../../fix_Win32_header.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure .. --prefix="/usr/${_arch}" --enable-shared --with-hdf5
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="${pkgdir}" install
    popd
    rm -rf "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
