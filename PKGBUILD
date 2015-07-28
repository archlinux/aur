# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

set -u
pkgname='conserver'
pkgver='8.2.1'
pkgrel='1'
pkgdesc='An application that allows multiple users to watch a serial console at the same time.'
arch=('i686' 'x86_64')
url='http://www.conserver.com'
license=('BSD')
depends=('sh')
source=("http://www.conserver.com/${pkgname}-${pkgver}.tar.gz")
sha256sums=('251ae01997e8f3ee75106a5b84ec6f2a8eb5ff2f8092438eba34384a615153d0')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j $(nproc)
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make bindir="${pkgdir}/usr/bin" \
    mandir="${pkgdir}/usr/share/man" \
    sbindir="${pkgdir}/usr/bin/" \
    libdir="${pkgdir}/usr/lib" \
    datadir="${pkgdir}/usr/share/${pkgname}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Ensure there are no forbidden paths (git-aurcheck)
  #! grep -alqr "/sbin" "${pkgdir}" || echo "${}" # one config file has sbin paths for something other than Linux
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  set +u
}
set +u
