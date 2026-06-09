# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# This package is hard to use and maintain. It depends on constantly outdated python boost libpcap.
# Use the compiled version justniffer which follows current versions.

set -u
pkgname='justniffer'
pkgname+='-bin'
pkgver=0.6.13
pkgrel=1
pkgdesc="TCP sniffer. It reassembles and reorders packets and displays the TCP flow in a customizable way."
arch=('x86_64')
url="https://onotelli.github.io/justniffer/"
url='https://justniffer.sourceforge.net'
_giturl="https://github.com/onotelli/${pkgname%-bin}"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++') # 'libnids' the package includes its own custom version of libnids
depends+=('libpcap')
depends+=('boost183-libs')
#depends+=('boost-libs')
depends+=('python312')
#makedepends=('patchelf')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
_srcdir="${pkgname%-bin}-${pkgver}"
source=("${_srcdir}-README.md::${_giturl}/raw/refs/tags/v${pkgver}/README.md")
source_x86_64=("${_srcdir}-x86_64.deb::${_giturl}/releases/download/v${pkgver}/${_srcdir//-/_}.noble_amd64.deb")
noextract=("${source_x86_64[@]%%::*}")
md5sums=('55af9038453818bf66d786f07a046135')
md5sums_x86_64=('15cc823cb521f14b7bf31f302b8867e5')
sha256sums=('c887ce8db4485df2d6838da4338a61e708dd1583064c6ffdc99c836f766c5ac8')
sha256sums_x86_64=('37634b80616eccbf289aab8ce902d38f53cbc58815d3dac8498923f47f9bca16')

prepare() {
  local -; set -u
  mkdir -p "${_srcdir}-${CARCH}"
  bsdtar -xf "${_srcdir}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components '1' -C "${_srcdir}-${CARCH}"
  rm -f data.tar.*

  cd "${_srcdir}-${CARCH}"
  find . -type f -name '*.gz' -exec \
    gzip -fd {} \;

  cd 'usr/bin'
  # patchelf --replace-needed "libpcap.so.0.8" "libpcap.so" "${pkgname%-bin}"

  cd "${srcdir}/${_srcdir}-${CARCH}/usr/share"
  rm -rf 'doc'
}

package() {
  local -; set -u
  cp -vr --no-preserve='ownership' "${_srcdir}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_srcdir}-README.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
set +u
