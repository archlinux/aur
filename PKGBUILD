# Maintainer: Shane Chen <ss1ha3tw@gmail.com>
pkgname=openvizsla-host-git
pkgver=r296.f70968b
pkgrel=1
pkgdesc='The host software of OpenVizsla, Open Hardware FPGA-based USB analyzer.'
arch=('x86_64')
url="http://openvizsla.org/"
license=('BSD')
depends=('libusb' 'python-crcmod')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/openvizsla/ov_ftdi.git#branch=master'
        'lib_path.patch'
        'udev.patch')
sha256sums=('SKIP'
            '5a73b6c29faf394eeeff45a613e3111faf1ffdc671143a488caa3e9f31d9a4c0'
            '1bb88c1749792b2bec238d37ca0aad25023701e973110bb16b379f7a5fcf92d6')

pkgver() {
  cd "$srcdir/ov_ftdi"
# Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/ov_ftdi"
  patch -p1 -i "$srcdir/udev.patch"
  patch -p1 -i "$srcdir/lib_path.patch"
}

build() {
  cd "$srcdir/ov_ftdi/software/host"
  make
}

package() {
  cd "$srcdir/ov_ftdi/software/host"
  install -Dm755 ovctl.py "${pkgdir}/usr/bin/ovctl"
  install -Dm644 libov.so "${pkgdir}/usr/lib/ov_ftdi/libov.so"
  install -Dm644 LibOV.py "${pkgdir}/usr/lib/ov_ftdi/LibOV.py"
  install -Dm644 usb_interp.py "${pkgdir}/usr/lib/ov_ftdi/usb_interp.py"
  install -Dm644 ov3.fwpkg "${pkgdir}/usr/lib/ov_ftdi/ov3.fwpkg"
  install -Dm644 52-openvizsla.rules "${pkgdir}/usr/lib/udev/rules.d/52-openvizsla.rules"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/openvizsla-host-git/LICENSE"
}
