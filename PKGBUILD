# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libmp3splt"
pkgname="lib32-${_name}"
pkgver=0.9.2
pkgrel=1
pkgdesc="Split mp3, ogg, and flac files without decoding - Library (32-bit)"
arch=('x86_64')
url="https://mp3splt.sourceforge.net"
_url="https://github.com/mp3splt/mp3splt"
license=('GPL-2.0-or-later')
depends=('lib32-flac>=1.2.1' 'lib32-glibc' 'lib32-libid3tag' 'lib32-libmad'
         'lib32-libogg' 'lib32-libltdl' 'lib32-libvorbis' 'lib32-pcre' "${_name}")
# checkdepends=('cutter-test_framework')
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz"
        "${_name}_fix_informations_spelling.patch::https://sources.debian.org/data/main/${_name::4}/${_name}/${pkgver}-0.1/debian/patches/fix-informations-spelling"
        "${_name}_fix_ogg_and_vorbis_state_structs_init.patch::${_url}/pull/359.patch?full_index=1"
        "${_name}_fix_snprintf_overflow.patch::${_url}/pull/368.patch?full_index=1"
        "${_name}_fix_flac_slience_trimming.patch::${_url}/pull/369.patch?full_index=1")
sha256sums=('30eed64fce58cb379b7cc6a0d8e545579cb99d0f0f31eb00b9acc8aaa1b035dc'
            'f6f730a6fc1231571368a3b984b24273bddbe1d9cc902111909ddd1221cca517'
            'bc3559e67f359da07c38cef57655950d7ebad5861671b98c92724f0fb3ff2580'
            'fe7e6e021ef80dce21782e35c8b6febb10432d4b9eee8757d3c8498ff94f6fad'
            'c9f2529f143c6b5cf7faeffe15a34b9690873925004105b6e601b3f18a36fcc3')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_fix_informations_spelling.patch"
  patch -Np2 -i "${srcdir}/${_name}_fix_ogg_and_vorbis_state_structs_init.patch"
  patch -Np2 -i "${srcdir}/${_name}_fix_snprintf_overflow.patch"
  patch -Np2 -i "${srcdir}/${_name}_fix_flac_slience_trimming.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/test"
#   ./run-tests.sh
# }

package() { 
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}
