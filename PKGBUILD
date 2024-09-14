# Maintainer:  Andreas Baumann <mail () andreasbaumann () cc>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase="libmp3splt"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=0.9.2
pkgrel=7
pkgdesc="Split mp3, ogg, and flac files without decoding - Library"
arch=('any')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
makedepends=('doxygen' 'flac>=1.2.1' 'graphviz' 'libid3tag' 'libmad' 'libogg'
             'libvorbis' 'pcre')
# checkdepends=('cutter-test')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgsrc}.tar.gz"
        "${pkgbase}_fix_informations_spelling.patch::https://sources.debian.org/data/main/${pkgbase::4}/${pkgbase}/${pkgver}-0.1/debian/patches/fix-informations-spelling"
        "${pkgbase}_fix_ogg_and_vorbis_state_structs_init.patch::https://sources.debian.org/data/main/m/mp3splt/2.6.2%2B20170630-3.2/debian/patches/10_Properly-zero-initialise-the-ogg-and-vorbis-state-st.patch")
sha256sums=('30eed64fce58cb379b7cc6a0d8e545579cb99d0f0f31eb00b9acc8aaa1b035dc'
            'f6f730a6fc1231571368a3b984b24273bddbe1d9cc902111909ddd1221cca517'
            '6c8721e71937b2f8b83189dad5be190de0bc0ece12bfcc9429e46d03e432e247')

prepare() {
  cd "${srcdir}"
  find . -name '*.patch' -exec sed -i 's#\(a\|b\)/libmp3splt#\1#g' {} +

  cd "${_pkgsrc}"
  for _patch in "${srcdir}/${pkgbase}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  sed -i 's/FreeSans\.ttf//g' "doc/Doxyfile_api.in"
  sed -i 's/FreeSans\.ttf//g' "doc/Doxyfile_all.in"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/test"
#   ./run-tests.sh
# }

package_libmp3splt() { 
  arch=('x86_64')
  depends=('flac>=1.2.1' 'glibc' 'libid3tag' 'libmad' 'libogg' 'libltdl'
           'libvorbis' 'pcre')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  libtool --finish "${pkgdir}/usr/lib"
  libtool --finish "${pkgdir}/usr/lib/libmp3splt0"

  rm -rf "${pkgdir}/usr/share/doc"

  install -Dm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -Dm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${pkgbase}/AUTHORS"
}

package_libmp3splt-docs() {
  pkgdesc="HTML documentation for ${pkgbase}"

  cd "${srcdir}/${_pkgsrc}/doc"
  make DESTDIR="${pkgdir}" install
}
