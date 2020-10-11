# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='usbimager'
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (GTK+ Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('20ffc3720f4c806285628064d536cbf5a59f05d6fdef92bd06f9fbd694426ce6')

prepare() {
  # Add LDFLAGS to Makefile
  sed -i "/LDFLAGS =/s/$/ ${LDFLAGS}/" "${pkgname}-${pkgver}/src/Makefile"
  # Skip chgrp and chmod operations in Makefile
  sed -i '160s/ifneq/ifeq/' "${pkgname}-${pkgver}/src/Makefile"
}

build() {
  USE_LIBUI=yes USE_UDISKS2=yes make -C "${pkgname}-${pkgver}/src"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "src/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "src/misc/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 32 64 128; do
    install -Dvm644 "src/misc/icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dvm644 "src/misc/${pkgname}.8.gz" -t "${pkgdir}/usr/share/man/man8"
  install -Dvm644 {'README.md',"${pkgname}-manual.pdf"} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
