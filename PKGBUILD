pkgname=mingw-w64-libsndfile
pkgver=1.2.2
pkgrel=2
pkgdesc="A C library for reading and writing files containing sampled audio data (mingw-w64)"
arch=(any)
url="https://libsndfile.github.io/libsndfile/"
license=(LGPL-2.1-or-later)
makedepends=('mingw-w64-cmake' 'python')
depends=('mingw-w64-flac' 'mingw-w64-libvorbis' 'mingw-w64-lame' 'mingw-w64-opus' 'mingw-w64-sqlite' 'mingw-w64-mpg123')
options=('staticlibs' '!strip' '!buildflags')
source=(https://github.com/libsndfile/libsndfile/releases/download/$pkgver/libsndfile-$pkgver.tar.xz{,.asc})
sha256sums=('3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e' 'SKIP')
validpgpkeys=(
  '6A91A5CF22C24C99A35E013FCFDCF91FB242ACED'  # Erik de Castro Lopo <erikd@mega-nerd.com>
  '9B1CFD2E92239C4B288E025F9D0D1F1CCB35FF8C'  # evpobr evpobr@gmail.com
  '31D95CAB6D80D262244A1750A47620E801E47E95'  # David Seifert soap@gentoo.org
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd libsndfile-${pkgver}
  # CVE-2022-33065
  curl -L https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c.patch | patch -p1
}

build() {
  cd libsndfile-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DENABLE_EXTERNAL_LIBS=ON -DENABLE_MPEG=ON -DINSTALL_MANPAGES=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
      -DBUILD_PROGRAMS=OFF -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -B build-${_arch} .
    cmake --build build-${_arch}
    ${_arch}-cmake -DENABLE_EXTERNAL_LIBS=ON -DENABLE_MPEG=ON -DINSTALL_MANPAGES=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
      -DBUILD_PROGRAMS=OFF -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -B build-${_arch}-static -DBUILD_SHARED_LIBS=OFF .
    cmake --build build-${_arch}-static
  done
}

package() {
  cd libsndfile-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build-${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build-${_arch}
    rm -r $pkgdir/usr/${_arch}/share/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

