# Maintainer: Robert Knauer <robert@privatdemail.net>

pkgname=freediameter-hg
_pkgname=freediameter
pkgver=1288.389c26b904d7
pkgrel=1
pkgdesc="An open source implementation of the diameter protocol"
arch=('i686' 'x86_64')
url="http://www.freediameter.net/"
license=('BSD')
depends=('gnutls' 'libidn')
makedepends=('cmake' 'mercurial' 'bison' 'flex')
install='freediameter-hg.install'
source=(
  'freediameter::hg+http://www.freediameter.net/hg/freeDiameter/'
  'freediameter.service'
)
sha256sums=(
  'SKIP'
  'd6bea4c108526222d1096a031eb8d1ff168eb73b0a22747a6efe85098759d52f'
)
provides=('freediameter')
conflicts=('freediameter')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
  cd "${srcdir}/${_pkgname}"
  # prepare build dir
  rm -rf 'build'
  mkdir 'build'
  cd 'build'
  # build
  cmake -DCMAKE_INSTALL_PREFIX:STRING=/usr -DDEFAULT_CONF_PATH:STRING=/etc/freediameter -DDISABLE_SCTP:BOOL=ON ../
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  # install systemd service file
  install -Dm 0644 "${srcdir}/freediameter.service" "${pkgdir}/usr/lib/systemd/system/freediameter.service"
  # install configuration files
  install -dm 0755 "${pkgdir}/etc/freediameter/samples/single_host/"
  install -m 0644 "../doc/"*".conf.sample" "${pkgdir}/etc/freediameter/samples/"
  install -m 0644 "../doc/"*".sql" "${pkgdir}/etc/freediameter/samples/"
  install -m 0644 "../doc/single_host/"* "${pkgdir}/etc/freediameter/samples/single_host/"
}
