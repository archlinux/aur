# Maintainer:  Andreas Baumann <mail () andreasbaumann () cc>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_basename="mp3splt"
pkgname="${_basename}"
_commit_rel="00b0f6298827678591e682543f12b02fca4c7075" # 2.6.3.1519
_commit="4b48268258c478993bd43703c0cdb0962b79f85f" # r2
pkgver="2.6.3.1519+r2+g${_commit::7}"
pkgrel=3
pkgdesc="Split mp3, ogg, and flac files without decoding - CLI"
arch=('i686' 'x86_64')
url="https://${_basename}.sourceforge.net"
_url="https://github.com/${_basename}/${_basename}"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmp3splt>=0.9.3.1519')
provides=('flacsplt' 'oggsplt')
_pkgsrc="${_basename}-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz"
        "${_basename}_year_var_output_pattern.patch::${_url}/pull/365.patch?full_index=1")
b2sums=('39a816d6fecb3ae15dc4a36dc2a93c8b9f695800f4366465581e3cc8e77a4b1052a7fed0e02421d549e7100bb5014b16f3ce965c2c9e37d2abb7fc2079d590fd'
        '8739e4ad962af3ddd9c10736199f3ca43640e647098881872f3d490a89a030cd6da574269be0146a0e632813f84670d8a590bdeb2f99fef175d8f21a1582f9da')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://github.com/mp3splt/mp3splt/pull/365
  patch -Np1 -i "${srcdir}/${_basename}_year_var_output_pattern.patch"

  cd "new${pkgname}"
  sed -i 's/1518/1519/g' 'configure.ac' 'README'
}

build() {
  cd "${srcdir}/${_pkgsrc}/new${pkgname}"
  # ./autogen.sh
  libtoolize -f
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --enable-oggsplt_symlink \
    --enable-flacsplt_symlink
  make
}

package() { 
  cd "${srcdir}/${_pkgsrc}/new${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
