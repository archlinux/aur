# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-x11"
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (X11 Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('hicolor-icon-theme' 'libx11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('20ffc3720f4c806285628064d536cbf5a59f05d6fdef92bd06f9fbd694426ce6')

prepare() {
  # Add LDFLAGS to Makefile
  sed -i "/LDFLAGS =/s/$/ ${LDFLAGS}/" "${_pkgname}-${pkgver}/src/Makefile"
  # Skip chgrp and chmod operations in Makefile
  sed -i '160s/ifneq/ifeq/' "${_pkgname}-${pkgver}/src/Makefile"
}

build() {
  make -C "${_pkgname}-${pkgver}/src"
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 "src/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "src/misc/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 32 64 128; do
    install -Dvm644 "src/misc/icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done
  install -Dm644 "src/misc/${_pkgname}.8.gz" -t "${pkgdir}/usr/share/man/man8"
  install -Dm644 {'README.md',"${_pkgname}-manual.pdf"} -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
