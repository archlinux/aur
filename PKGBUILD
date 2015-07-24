# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : xav <xav at ethertricks dot net>

set -u
pkgname='sflowtool'
pkgver='3.27'
pkgrel='1'
pkgdesc='CLI utility and scripts for analyzing sFlow data'
arch=('i686' 'x86_64')
url='http://www.inmon.com/technology/sflowTools.php'
license=('custom')
optdepends=('perl: scripts support')
source=("http://www.inmon.com/bin/${pkgname}-${pkgver}.tar.gz"
        'http://www.inmon.com/bin/sflowutils.tar.gz'
        'LICENSE')
sha256sums=('18918087b267348846ebf985e6cc25e5460c291c2e0d38042440ce784a0e0f55'
            '45f6a0f96bdb6a1780694b9a4ef9bbd2fd719b9f7f3355c6af1427631b311d56'
            '863b86b7a4fc7632cfc3f9ead7e76f6e7751aca8b64030ff97b3b46f991c6482')

prepare() {
set -u
   cd "${srcdir}/${pkgname}-${pkgver}"
   ./configure --prefix='/usr' --mandir='/usr/share/man'
set +u
}

build() {
set -u
   cd "${srcdir}/${pkgname}-${pkgver}"
   make
set +u
}

package(){
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/share/${pkgname}"/{utils,contrib}
  cp -pR "${srcdir}/utils" "${pkgdir}/usr/share/${pkgname}/"
  cp -pR "${srcdir}/contrib" "${pkgdir}/usr/share/${pkgname}/"
  cp -p "${srcdir}/README" "${pkgdir}/usr/share/${pkgname}/README"
  install -Dpm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Ensure there are no forbidden paths (git-aurcheck)
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"
set +u
}

set +u
