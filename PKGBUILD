# Maintainer: thegala <thegala at disroot dot org>
pkgname=f32c-tools
pkgver=e2f63f8
pkgrel=1
pkgdesc="ULX2S / ULX3S FPGA JTAG programmer & tools (Lattice XP2 / ECP5)"
arch=('x86_64')
url='https://github.com/f32c/tools'
license=('BSD-2-Clause')
depends=('python' 'python-pyserial' 'libusb' 'libftdi' 'libftdi-compat')
makedepends=('git')
provides=("ujprog" "f32cup" "ft232r_flash")
source=("git+https://github.com/f32c/tools"
        "80-fpga-ulx3s.rules"
        "Makefile")
sha256sums=('SKIP'
            '8ca346c65ca04f8b06e6877180b2f1eed7b7dbd8ce3ee5ad2d80da7158175686'
            '049bf81803205679f108d2fa6a4cc426d97e7de7254322e35de2e46679c62f6b')

prepare() {
  cd "${srcdir}/tools/ujprog"
  rm -f Makefile
  ln -s ../../Makefile Makefile
}

build() {
  cd "${srcdir}/tools/ujprog"
  make
  make flash
}

package() {
  install -Dm755 "${srcdir}/tools/ujprog/ujprog" "${pkgdir}/usr/bin/ujprog"
  install -Dm755 "${srcdir}/tools/ujprog/ft232r_flash" "${pkgdir}/usr/bin/ft232r_flash"
  install -Dm755 "${srcdir}/tools/f32cup/f32cup.py" "${pkgdir}/usr/bin/f32cup"
  install -Dm644 "${srcdir}/tools/f32cup/f32cup.ino" "${pkgdir}/usr/share/f32c-tools/f32cup/example/f32cup.ino"
  install -Dm644 "80-fpga-ulx3s.rules" "${pkgdir}/usr/lib/udev/rules.d/80-fpga-ulx3s.rules"
  sed -n '1,26p' "${srcdir}/tools/ujprog/ujprog.c" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
