# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-x11"
pkgver=1.0.6
pkgrel=1
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (X11 Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('hicolor-icon-theme' 'libx11')
makedepends=('setconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'makefile.patch')
sha256sums=('1d436524c46d756bd4ab598929b41e6d8dc6d23e11c8576667cb44999e6e87b8'
            'a8622b5584d5458b608096f24ab2e52e40f1970baaf4e4cd1ffd69b64d149828')

prepare() {
  cd "${_pkgname}-${pkgver}"
  setconf 'src/Makefile' 'LDFLAGS' "${LDFLAGS}" # Add LDFLAGS to Makefile
  patch --forward --strip=1 --input="${srcdir}/makefile.patch" # Skip chgrp and chmod operations in Makefile
}

build() {
  make -C "${_pkgname}-${pkgver}/src"
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dvm755 "src/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "src/misc/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for i in 16 32 64 128; do
    install -Dvm644 "src/misc/icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done
  install -Dvm644 "src/misc/${_pkgname}.8.gz" -t "${pkgdir}/usr/share/man/man8"
  install -Dvm644 {'README.md',"${_pkgname}-manual.pdf"} -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
