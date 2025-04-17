# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="justniffer"
pkgname="${_pkgname}-bin"
pkgver=0.5.22
pkgrel=1
pkgdesc="TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way."
arch=('x86_64')
url="https://onotelli.github.io/justniffer"
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
sha256sums_x86_64=('5f2a59a899f81d2e5a4ad4c587e45688bb2bc03910328109f061d2278371d18b')

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
  patchelf --replace-needed "libpcap.so.0.8" "libpcap.so" "${_pkgname}"
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
