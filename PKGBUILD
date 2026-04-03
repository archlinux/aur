# Maintainer: Stephano Cetola <stephanoc@gmail.com>
# SPDX-License-Identifier: MIT

pkgname=mnt-reform-lpc-dkms
_pkgbase=reform2_lpc
pkgver=1.85
pkgrel=1
pkgdesc='DKMS module for the MNT Reform LPC11U24 system controller'
arch=('aarch64')
url='https://source.mnt.re/reform/reform-tools'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('mnt-reform-lpc')
conflicts=('mnt-reform-lpc')
source=("reform-tools::git+https://source.mnt.re/reform/reform-tools.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
    local _srcdir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

    install -d "${_srcdir}"
    install -Dm644 "${srcdir}/reform-tools/lpc/Makefile" "${_srcdir}/Makefile"
    install -Dm644 "${srcdir}/reform-tools/lpc/reform2_lpc.c" "${_srcdir}/reform2_lpc.c"

    cat > "${_srcdir}/dkms.conf" <<EOF_DKMS
PACKAGE_NAME="${_pkgbase}"
PACKAGE_VERSION="${pkgver}"
BUILT_MODULE_NAME[0]="reform2_lpc"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/updates/dkms"
MAKE[0]="make KERNEL_DIR=/lib/modules/\${kernelver}/build"
AUTOINSTALL="yes"
EOF_DKMS
}
