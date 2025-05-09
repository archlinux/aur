# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="justniffer"
pkgname="${_pkgname}-bin"
pkgver=0.6.2
pkgrel=1
pkgdesc="TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way."
arch=('x86_64')
url="https://onotelli.github.io/justniffer/"
_url="https://github.com/onotelli/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('boost183-libs' 'gcc-libs' 'glibc' 'libpcap') # 'boost-libs'
makedepends=('gzip' 'patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-AUTHORS::${_url}/raw/refs/tags/v${pkgver}/AUTHORS"
        "${_pkgsrc}-COPYING::${_url}/raw/refs/tags/v${pkgver}/COPYING")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}.noble_amd64.deb")
noextract=("${source_x86_64[@]%%::*}")
sha256sums=('dff89e69fe6c268939c410c7a10afdc3ad44cdf889126197abdc149881b92fc9'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('e7cd1d87762c1f29fd192adaced1f9c56638a63ddf317fecfdb9223cce880701')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find . -type f -name '*.gz' -exec \
    gzip -fd {} \;

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/bin"
  patchelf --replace-needed "libpcap.so.0.8" "libpcap.so" "${_pkgname}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright* INSTALL *.Debian
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-AUTHORS" "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -vDm644 "${_pkgsrc}-COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
