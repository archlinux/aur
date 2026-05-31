# PKGBUILD for udfclientfs-fuse3
# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=udfclientfs-fuse3
pkgver=0.8.21
pkgrel=1
pkgdesc='UDF filesystem tools with FUSE 3 support.  Provides udfclientfs (fuse), udfclient, newfs_udf, cd_disect, cd_sessions, mmc_format, udfdump'
arch=('x86_64')
url='https://www.13thmonkey.org/udfclient/'
license=('LicenseRef-Clarified Artistic')
depends=('fuse3')
makedepends=('bmake' 'patch')
provides=('udfclient' 'udfclientfs')
conflicts=('udfclient' 'udfclientfs')
source=("${url}releases/UDFclient.${pkgver}.tgz"
        "http://distcache.FreeBSD.org/local-distfiles/avg/udfclientfs-0.6.tgz"
        "fix-fgets-unused-result.patch"
        "fix-packed-member-address.patch"
        "udfclientfs-freebsd.patch"
        "fix-sector-size-detection.patch"
        "fix-fuse3-linux.patch")
sha256sums=('83deab4d97d8e5f67baa47aa779c41d35b5f5ef348bcea36bebb1549534c6f5e'
            'a115ef941ee56df3a14a3919e7225f046bef9577afbed7e873b1a868b3c0b301'
            'af7be2743ffd3aa5dac21c57a1bc52e00a3619032f96962f99a4e7f44e0fa3cb'
            '831ccde1381f9be7b1e76832222d92bdd674cccdbf7b28cf499ed6a44f27ab8c'
            '952082f234f496a2804e50e639332f97962bab2518dfb63c294ea297a18a1e3f'
            '9d181a4168b5dde788c7223a3a8a1f7b45020876e3dda09086865cc4707948c0'
            'ea7dc0d0582e6896616ab982e76034cd180f44032ccfe845bb646efab4b2fc07')

prepare() {
  cd "${srcdir}/UDFclient.${pkgver}"
  patch -p1 < "${srcdir}/fix-fgets-unused-result.patch"
  patch -p1 < "${srcdir}/fix-packed-member-address.patch"
  # FreeBSD udfclientfs patch: adds FUSE hooks, udfclientfs target to Makefile (re-based)
  patch -p1 < "${srcdir}/udfclientfs-freebsd.patch"
  # FUSE shim source (from FreeBSD distfile)
  cp "${srcdir}/udfclientfs/udfclientfs.c" .
  # Auto-detect sector size for regular files and add -b option
  patch -p1 < "${srcdir}/fix-sector-size-detection.patch"
  # Convert to FUSE 3 API + Linux compatibility
  patch -p1 < "${srcdir}/fix-fuse3-linux.patch"
}

build() {
  cd "${srcdir}/UDFclient.${pkgver}"
  ./configure --prefix=/usr
  bmake -s
}

check() {
  cd "${srcdir}/UDFclient.${pkgver}"
  # Verify all expected binaries build
  for app in udfclient newfs_udf udfdump cd_sessions cd_disect mmc_format udfclientfs; do
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
