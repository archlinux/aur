# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="justniffer"
pkgname="${_pkgname}-bin"
pkgver=0.5.19
pkgrel=1
pkgdesc="TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way."
arch=('x86_64')
url="https://onotelli.github.io/justniffer"
_url="https://github.com/onotelli/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('boost174-libs' 'gcc-libs' 'glibc' 'libpcap') # 'boost-libs'
makedepends=('gzip' 'patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source=("${_pkgsrc}-AUTHORS::${_url}/raw/refs/tags/v${pkgver}/AUTHORS"
        "${_pkgsrc}-COPYING::${_url}/raw/refs/tags/v${pkgver}/COPYING")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_amd64.deb")
sha256sums=('dff89e69fe6c268939c410c7a10afdc3ad44cdf889126197abdc149881b92fc9'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
sha256sums_x86_64=('7dcdb44e4cc5901684217a45ce8ff41064c73aa77ae5d1e50fd8cd6eb6040c12')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  find "${_pkgsrc}-${CARCH}" -type f -name '*.gz' -exec \
    gzip -fd {} \;
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/bin"
  #patchelf --replace-needed "libpcap.so.0.8" "libpcap.so" "${_pkgname}"
  # patchelf --replace-needed "libboost_regex.so.1.74.0" "libboost_regex.so" "${_pkgname}"
  # patchelf --replace-needed "libboost_program_options.so.1.74.0" "libboost_program_options.so" "${_pkgname}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright* INSTALL *.Debian
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-AUTHORS" "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -vDm644 "${_pkgsrc}-COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
