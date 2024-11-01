# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="justniffer"
pkgname="${_pkgname}-bin"
pkgver=0.5.16
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
noextract=("${_pkgsrc}-x86_64.deb")
source=("COPYING-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/COPYING"
        "AUTHORS-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/AUTHORS")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://launchpad.net/~oreste-notelli/+archive/ubuntu/ppa/+files/${_pkgsrc//-/_}.noble_amd64.deb")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            'dff89e69fe6c268939c410c7a10afdc3ad44cdf889126197abdc149881b92fc9')
sha256sums_x86_64=('c221bdce768d394d23e1a4a9118dc6763b6acb5cf542c231bab30071cd8f93f5')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share"
  mkdir -p "doc/${_pkgname}" "licenses/${_pkgname}"
  mv -f "${srcdir}/AUTHORS-${pkgver}" "doc/${_pkgname}/AUTHORS"
  mv -f "${srcdir}/COPYING-${pkgver}" "licenses/${_pkgname}/COPYING"

  find . -type f -name '*.gz' -exec \
    gzip -fd {} \;
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/bin"
  patchelf --replace-needed "libpcap.so.0.8" "libpcap.so" "${_pkgname}"
  # patchelf --replace-needed "libboost_program_options.so.1.83.0" "libboost_program_options.so.1.86.0" "${_pkgname}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${_pkgname}"
  rm -f copyright* INSTALL *.Debian
}

package() {
  cd "${srcdir}"
  cp -rL --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"
}
