# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Eric Bélanger <eric@archlinux.org>

_srcname=libsndfile
pkgname=${_srcname}-git_p
_tag=1.0.26pre6
pkgver=1.0.26pre6.d9bae19
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac-git_p' 'libvorbis')
checkdepends=('python2')
conflicts=('libsndfile' 'libsndfile-git')
provides=('libsndfile' 'libsndfile-git')
source=("${_srcname}::git+https://github.com/erikd/libsndfile.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  printf "${_tag}.$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_srcname}"
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' src/binheader_writef_check.py \
  src/create_symbols_file.py programs/test-sndfile-metadata-set.py
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr --disable-sqlite --enable-external-libs
  make
}

check() {
  cd "${srcdir}/${_srcname}"
  make check
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
}
