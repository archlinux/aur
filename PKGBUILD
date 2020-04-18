# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase=amd-sfh-hid
pkgname="${_pkgbase}-dkms"
pkgver=1
pkgrel=1
pkgdesc="Experimental HID driver modules for the AMD Sensor Fusion Hub (DKMS)"
arch=('i686' 'x86_64')
url="https://gist.github.com/conqp/33baa079d9524914c4c0c196200e4f89"
license=('GPL2')
depends=('dkms')
makedepends=('patchutils')
source=("${_pkgbase}-${pkgver}.patch::https://gist.githubusercontent.com/conqp/33baa079d9524914c4c0c196200e4f89/raw/72a578d08abb8cba1be9bec0c435094dc1ee2da6/amd-sfh.patch"
        'dkms.conf')
md5sums=('35e6da8143ef70216cffcf1dc125ea70'
         '9cfe1506bb695c72daaf03978dd43637')

prepare() {
  # Fix patch for DKMS
  filterdiff -p1 -x "Documentation/hid/index.rst" \
                 -x "MAINTAINERS" \
  "${srcdir}/${_pkgbase}-${pkgver}.patch" | patch -Np1
}

package() {
  local DEST="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

  install -dm 755 "${DEST}"

  for file in drivers/hid/amd-sfh-hid/*; do
    install -m 640 "${file}" "${DEST}"
  done

  # Copy dkms.conf
  install -m644 dkms.conf "${DEST}"

  # Set name and version
  sed -e "s/@PKGVER@/${pkgver}/" -i "${DEST}/dkms.conf"
}
