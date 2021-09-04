# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='usbimager'
pkgver=1.0.8
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (GTK+ Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
makedepends=('setconf')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'makefile.patch')
sha256sums=('8d085095c19a123851ad41ba7d5045f7ba77280fc6c79143e00d7c9d0dade5d1'
            'a8622b5584d5458b608096f24ab2e52e40f1970baaf4e4cd1ffd69b64d149828')

prepare() {
  cd "${pkgname}-${pkgver}"
  setconf 'src/Makefile' 'LDFLAGS' "${LDFLAGS}" # Add LDFLAGS to Makefile
  patch --forward --strip=1 --input="${srcdir}/makefile.patch" # Skip chgrp and chmod operations in Makefile
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
