# PKGBUILD for udfclientfs
# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=udfclientfs
pkgver=0.8.21
pkgrel=1
pkgdesc='a userland implementation of the UDF filingsystem — provides udfclient, newfs_udf, cd_disect, cd_sessions, mmc_format, and udfdump'
arch=('x86_64')
url='https://www.13thmonkey.org/udfclient/'
license=('LicenseRef-Clarified Artistic')
depends=('glibc')
makedepends=('bmake')
provides=('udfclient')
conflicts=('udfclient')
source=("${url}releases/UDFclient.${pkgver}.tgz")
sha256sums=('83deab4d97d8e5f67baa47aa779c41d35b5f5ef348bcea36bebb1549534c6f5e')

build() {
  cd "${srcdir}/UDFclient.${pkgver}"
  ./configure --prefix=/usr
  bmake -s
}

check() {
  cd "${srcdir}/UDFclient.${pkgver}"
  # Verify all expected binaries build
  for app in udfclient newfs_udf udfdump cd_sessions cd_disect mmc_format; do
    if [[ ! -x "${app}" ]]; then
      printf 'ERROR: missing built binary: %s\n' "${app}" >&2
      exit 1
    fi
  done
}

package() {
  cd "${srcdir}/UDFclient.${pkgver}"

  # Binaries
  install -d "${pkgdir}/usr/bin"
  bmake DESTDIR="${pkgdir}" install >/dev/null

  # Man pages (not installed by the Makefile)
  install -Dm 644 newfs_udf.8 "${pkgdir}/usr/share/man/man8/newfs_udf.8"
  install -Dm 644 mmc_format.8 "${pkgdir}/usr/share/man/man8/mmc_format.8"

  # License
  install -Dm 644 LICENCE.clearified.artistic "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
# vim:set ts=2 sw=2 et ft=PKGBUILD:
