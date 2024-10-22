# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mp3splt"
pkgname="${_pkgname}-bin"
pkgver=2.6.2
pkgrel=3
pkgdesc="Split mp3, ogg, and flac files without decoding - CLI"
arch=('x86_64' 'i686')
url="https://mp3splt.sourceforge.net"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmp3splt>=0.9.2')
makedepends=('gzip')
provides=("${_pkgname}" 'oggsplt' 'flacsplt')
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.jessie_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://downloads.sourceforge.net/sourceforge/mp3splt/${_pkgname}_${pkgver}.jessie_i386.deb")
sha256sums_x86_64=('a36f6b13790238ff5f793c88920c0e43d0f3e04e584f6714ab2543510ca49386')
sha256sums_i686=('cb8d797d8d6ecd3f0cf33f555ded5dc84f0e19b22a61a181b0cd37a09b9a4035')

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
  cd "${srcdir}"
  cp -r --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"
}
