# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="justniffer"
pkgname="${_pkgname}-bin"
pkgver=0.5.17
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
source=("COPYING-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/COPYING"
        "AUTHORS-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/AUTHORS")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_amd64.deb")
sha256sums=('8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            'dff89e69fe6c268939c410c7a10afdc3ad44cdf889126197abdc149881b92fc9')
sha256sums_x86_64=('562298efdb7886ecd72058817bfe4dca1e6c5ee7a1ed749d02d7f8dd9cf5ef7d')

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
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"

  cd "${srcdir}"
  install -vDm644 "AUTHORS-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -vDm644 "COPYING-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
