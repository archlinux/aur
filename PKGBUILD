# Maintainer:  Andreas Baumann <mail () andreasbaumann () cc>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase="libmp3splt"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.9.2
pkgrel=11
pkgdesc="Split mp3, ogg, and flac files without decoding - Library"
arch=('x86_64' 'i686')
url="https://mp3splt.sourceforge.net"
_url="https://github.com/mp3splt/mp3splt"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'flac>=1.2.1' 'graphviz' 'libid3tag' 'libmad' 'libogg'
             'libvorbis' 'pcre')
# checkdepends=('cutter-test')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz"
        "${pkgbase}_fix_informations_spelling.patch::https://sources.debian.org/data/main/${pkgbase::4}/${pkgbase}/${pkgver}-0.1/debian/patches/fix-informations-spelling"
        "${pkgbase}_fix_ogg_and_vorbis_state_structs_init.patch::${_url}/pull/359.patch?full_index=1"
        "${pkgbase}_fix_snprintf_overflow.patch::${_url}/pull/368.patch?full_index=1"
        "${pkgbase}_fix_flac_slience_trimming.patch::${_url}/pull/369.patch?full_index=1")
sha256sums=('30eed64fce58cb379b7cc6a0d8e545579cb99d0f0f31eb00b9acc8aaa1b035dc'
            'f6f730a6fc1231571368a3b984b24273bddbe1d9cc902111909ddd1221cca517'
            'bc3559e67f359da07c38cef57655950d7ebad5861671b98c92724f0fb3ff2580'
            'fe7e6e021ef80dce21782e35c8b6febb10432d4b9eee8757d3c8498ff94f6fad'
            'c9f2529f143c6b5cf7faeffe15a34b9690873925004105b6e601b3f18a36fcc3')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "../${pkgbase}_fix_informations_spelling.patch"
  patch -Np2 -i "../${pkgbase}_fix_ogg_and_vorbis_state_structs_init.patch"
  patch -Np2 -i "../${pkgbase}_fix_snprintf_overflow.patch"
  patch -Np2 -i "../${pkgbase}_fix_flac_slience_trimming.patch"

  cd "doc"
  sed -i 's/FreeSans\.ttf//g' "Doxyfile_api.in"
  sed -i 's/FreeSans\.ttf//g' "Doxyfile_all.in"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool # Fix overlinking
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/test"
#   ./run-tests.sh
# }

package_libmp3splt() { 
  depends=('flac>=1.2.1' 'glibc' 'libid3tag' 'libmad' 'libogg' 'libltdl'
           'libvorbis' 'pcre')
  provides=("${pkgbase}.so")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  libtool --finish "${pkgdir}/usr/lib"
  libtool --finish "${pkgdir}/usr/lib/libmp3splt0"

  rm -rf "${pkgdir}/usr/share/doc"

  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgbase}/AUTHORS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
}

package_libmp3splt-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/doc"
  make DESTDIR="${pkgdir}" install
}
