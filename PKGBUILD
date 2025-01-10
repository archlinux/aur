# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="mp3splt"
_name="lib${_basename}"
pkgname="lib32-${_name}"
_commit_rel="00b0f6298827678591e682543f12b02fca4c7075" # 0.9.3.1519
_commit="4b48268258c478993bd43703c0cdb0962b79f85f" # r5
pkgver="0.9.3.1519+r5+g${_commit::7}"
pkgrel=1
pkgdesc="Split mp3, ogg, and flac files without decoding - Library (32-bit)"
arch=('x86_64')
url="https://${_basename}.sourceforge.net"
_url="https://github.com/${_basename}/${_basename}"
license=('GPL-2.0-or-later')
depends=('lib32-flac>=1.2.1' 'lib32-glibc' 'lib32-libid3tag' 'lib32-libmad'
         'lib32-libogg' 'lib32-libltdl' 'lib32-libvorbis' 'lib32-pcre' "${_name}")
# checkdepends=('lib32-cutter-test_framework')
provides=("${_name}.so")
_pkgsrc="${_basename}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_basename}_init_ogg_and_vorbis_state_structs_init.patch::${_url}/pull/359.patch?full_index=1"
        "${_basename}_year_var_output_pattern.patch::${_url}/pull/365.patch?full_index=1"
        "${_basename}_oformat_parser_snprintf_overflow.patch::${_url}/pull/368.patch?full_index=1"
        "${_basename}_flac_slience_trimming.patch::${_url}/pull/369.patch?full_index=1"
        "${_basename}_informations_spelling.patch"
        "${_basename}_cross_compile_cutter_check.patch")
sha256sums=('2c019762cd395f4c9e513d2801822d4a4b52d3ae785b4ce9a7ce581dc27751ba'
            'bc3559e67f359da07c38cef57655950d7ebad5861671b98c92724f0fb3ff2580'
            '1a44a40b364ea060d8f89af8af0157f951f8e8f40c2ad1db4a7d01876bf21f7d'
            'fe7e6e021ef80dce21782e35c8b6febb10432d4b9eee8757d3c8498ff94f6fad'
            'c9f2529f143c6b5cf7faeffe15a34b9690873925004105b6e601b3f18a36fcc3'
            'c7e4b82b6fca51f8f6eab97045201881ba39c3552d06b2e565c5b49e88ad4ea8'
            '9581470d354003c619a2f3a2eb21ab1f031bad41a6ef53a87125b1c3c8f3aa6f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://github.com/mp3splt/mp3splt/pull/359, https://nvd.nist.gov/vuln/detail/CVE-2017-11333
  patch -Np1 -i "${srcdir}/${_basename}_init_ogg_and_vorbis_state_structs_init.patch"
  # https://github.com/mp3splt/mp3splt/pull/365
  patch -Np1 -i "${srcdir}/${_basename}_year_var_output_pattern.patch"
  # https://github.com/mp3splt/mp3splt/pull/368, https://github.com/mp3splt/mp3splt/issues/367
  patch -Np1 -i "${srcdir}/${_basename}_oformat_parser_snprintf_overflow.patch"
  # https://github.com/mp3splt/mp3splt/pull/369
  patch -Np1 -i "${srcdir}/${_basename}_flac_slience_trimming.patch"
  # https://sources.debian.org/patches/libmp3splt/0.9.2-0.1/fix-informations-spelling/
  patch -Np1 -i "${srcdir}/${_basename}_informations_spelling.patch"
  # https://sources.debian.org/patches/mp3splt/2.6.2%2B20170630-3.3/cross.patch/
  patch -Np1 -i "${srcdir}/${_basename}_cross_compile_cutter_check.patch"

  cd "${_name}"
  sed -i 's/1518/1519/g' 'configure.ac' 'README'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}/${_name}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --disable-optimise \
    --disable-cutter
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/${_name}/test"
#   ./run-tests.sh
# }

package() { 
  cd "${srcdir}/${_pkgsrc}/${_name}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}
