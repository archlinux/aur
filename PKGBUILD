# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# This package is hard to use and maintain. It depends on constantly outdated python boost libpcap.
# Use the compiled version justniffer which follows current versions.

set -u
pkgname='justniffer'
pkgname+='-bin'
pkgver=0.6.14
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
md5sums=('7b88b20cc6a50ec4a3637701dd8cc271')
md5sums_x86_64=('5cf7ba4e0649755f75be1bd066540335')
sha256sums=('ba2b6ac64f8c23198b216db032838e85acb7c594daeb525f2be9d871923afcaf')
sha256sums_x86_64=('7ad8125cd9bc18b152f49f814944f79d9ce81fb5f1cb0c7327ff9f3583da5d41')

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
