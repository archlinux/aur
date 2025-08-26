# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="justniffer"
pkgname="${_pkgname}-bin"
pkgver=0.6.12
pkgrel=1
pkgdesc="TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way."
arch=('x86_64')
url="https://onotelli.github.io/justniffer/"
_url="https://github.com/onotelli/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('boost183-libs' 'gcc-libs' 'glibc' 'libpcap') # 'boost-libs'
makedepends=('gzip') # 'patchelf'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}.noble_amd64.deb")
noextract=("${source_x86_64[@]%%::*}")
sha256sums=('c887ce8db4485df2d6838da4338a61e708dd1583064c6ffdc99c836f766c5ac8')
sha256sums_x86_64=('dbcb469465d78031653193ca1b9bd07b327803c0b5c4bd340082402d017866fd')

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
  # patchelf --replace-needed "libpcap.so.0.8" "libpcap.so" "${_pkgname}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share"
  rm -rf doc
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
