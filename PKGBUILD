# Maintainer: Marco Matos <marco.ufs@gmail.com>

_pkgbase=ms912x
pkgname=ms912x-dkms-git
pkgver=r70.e3acb12
pkgrel=1
pkgdesc='Experimental DKMS driver for MacroSilicon MS912x USB display adapters'
arch=('any')
url='https://github.com/tiirwaa/ms912x'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=("ms912x-dkms=${pkgver}")
conflicts=('ms912x-dkms')
source=("${_pkgbase}::git+https://github.com/tiirwaa/ms912x.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf 'r%s.%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  local dkmsdir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  install -dm755 "${dkmsdir}"
  install -m644 -t "${dkmsdir}" \
    "${_pkgbase}/Makefile" \
    "${_pkgbase}"/*.c \
    "${_pkgbase}"/*.h

  # Do not use the upstream dkms.conf: it hard-codes version 0.1 and does
  # not explicitly pass the target kernel version to the module Makefile.
  cat > "${dkmsdir}/dkms.conf" <<EOF_DKMS
PACKAGE_NAME="${_pkgbase}"
PACKAGE_VERSION="${pkgver}"

MAKE[0]="make KVER=\${kernelver}"

BUILT_MODULE_NAME[0]="${_pkgbase}"
BUILT_MODULE_LOCATION[0]=""
DEST_MODULE_LOCATION[0]="/kernel/drivers/gpu/drm/"
AUTOINSTALL="yes"
EOF_DKMS

  install -Dm644 "${_pkgbase}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgbase}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
