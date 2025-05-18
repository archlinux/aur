# Maintainer:  Andreas Baumann <mail () andreasbaumann () cc>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_basename="mp3splt"
pkgbase="lib${_basename}"
pkgname=("${pkgbase}"{,'-docs'})
_commit_rel="00b0f6298827678591e682543f12b02fca4c7075" # 0.9.3.1519
_commit="4b48268258c478993bd43703c0cdb0962b79f85f" # r5
pkgver="0.9.3.1519+r5+g${_commit::7}"
pkgrel=4
pkgdesc="Split mp3, ogg, and flac files without decoding - Library"
arch=('i686' 'x86_64')
url="https://${_basename}.sourceforge.net"
_url="https://github.com/${_basename}/${_basename}"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'flac>=1.2.1' 'graphviz' 'libid3tag' 'libmad' 'libogg'
             'libvorbis' 'pcre')
# checkdepends=('cutter-test_framework')
_pkgsrc="${_basename}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_basename}_init_ogg_and_vorbis_state_structs_init.patch::${_url}/pull/359.patch?full_index=1"
        "${_basename}_year_var_output_pattern.patch::${_url}/pull/365.patch?full_index=1"
        "${_basename}_oformat_parser_snprintf_overflow.patch::${_url}/pull/368.patch?full_index=1"
        "${_basename}_flac_slience_trimming.patch::${_url}/pull/369.patch?full_index=1"
        "${_basename}_informations_spelling.patch"
        "${_basename}_ogg_plugin_prototype.patch")
b2sums=('39a816d6fecb3ae15dc4a36dc2a93c8b9f695800f4366465581e3cc8e77a4b1052a7fed0e02421d549e7100bb5014b16f3ce965c2c9e37d2abb7fc2079d590fd'
        'ffceb5f0171eb6e11b02fb1fdf4a54ec38ac242a2ad19f552fc8fe81f0d276123480e59a9e687b2da6f036d48b8b7e88a149579f94a1b9c2edca7302e46315c9'
        '8739e4ad962af3ddd9c10736199f3ca43640e647098881872f3d490a89a030cd6da574269be0146a0e632813f84670d8a590bdeb2f99fef175d8f21a1582f9da'
        '2049015a20a27318c8122e507447540f966a8d0699b873513fc0e561041f80510912b03ee3fab20de556a90d8a88e57efcf6ee0c8b915f55f960197fb406cb11'
        '406ecb1c5cdbc507cd74dab8b0e42dafd5938a6f73b48133ab26edbf69768a2cdde1b1453178940f65165b49e93a36b0517597d2ea7c7b48d1d6ec1ce4155a3c'
        '4cc4d17eff23e64e6c7721ae70032d0718c5b8f3460195557432938c81528a3b930f0d61b931ab31a14d4cd2c00392fa81fdac65bf391f8b21430aeb4de303de'
        'e7c3c271bee4ebb53fffaa5a6985683b9f946004650b32c01c9c8687331426d8fda26b71d8df0d1f7495f9860a57b57d45939ab22cebd673afbda8d703194545')

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
  # gcc 15.1 doens't like () prototypes for `int splt_ogg_new_stream_needs_header_packet(splt_ogg_new_stream_handler *nsh)`
  patch -Np1 -i "${srcdir}/${_basename}_ogg_plugin_prototype.patch"

  cd "${pkgbase}"
  sed -i 's/1518/1519/g' 'configure.ac' 'README'
  
  cd "doc"
  sed -i 's/FreeSans\.ttf//g' 'Doxyfile'*
}

build() {
  cd "${srcdir}/${_pkgsrc}/${pkgbase}"
  # ./autogen.sh
  libtoolize -f
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --disable-optimise \
    --disable-cutter
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/${pkgbase}/test"
#   ./run-tests.sh
# }

package_libmp3splt() { 
  depends=('flac>=1.2.1' 'glibc' 'libid3tag' 'libmad' 'libogg' 'libltdl'
           'libvorbis' 'pcre')
  provides=("${pkgbase}.so")

  cd "${srcdir}/${_pkgsrc}/${pkgbase}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/doc"

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgbase}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

package_libmp3splt-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/${pkgbase}/doc"
  make DESTDIR="${pkgdir}" install
}
