# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="mp3splt"
_pkgname="${_basename}"
pkgname="${_pkgname}-bin"
pkgver=2.6.2
pkgrel=4
pkgdesc="Split mp3, ogg, and flac files without decoding - CLI"
arch=('x86_64' 'i686')
url="https://${_basename}.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmp3splt>=0.9.2')
makedepends=('gzip')
provides=("${_pkgname}" 'oggsplt' 'flacsplt')
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://downloads.sourceforge.net/sourceforge/${_basename}/${_pkgname}_${pkgver}.unstable_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/${_basename}/${_pkgname}_${pkgver}.unstable_i386.deb")
sha256sums_x86_64=('0b85c2ca53b955fa1098f0595d49cdb696b4d1f2f38ec349a648480a2ca58e62')
sha256sums_i686=('820d7d6f61954f80e5e6b5d1d2f83c6a817a8cc38b853b885ecb65129f35b80f')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share/doc"
  find . -type f -name '*.gz' -exec \
    gzip -fd {} \;
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright* INSTALL
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"
}
