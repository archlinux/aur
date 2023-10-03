# Maintainer: robertfoster
# Contributor: Michael Duell <michael.duell@rub.de> PGP-Key: 5566FF77 Fingerprint FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77

pkgname=rtl-sdr-git
pkgrel=1
pkgver=0.8.0.r2.gfe22586
pkgdesc="Driver for Realtek RTL2832U, allowing general purpose software defined radio (SDR)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/librtlsdr/librtlsdr"
license=('GPL')
depends=('libusb>=1.0')
makedepends=('git' 'cmake')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
install="${pkgname%%-git}.install"
source=("${pkgname%%-git}::git+${url}"
  'rtlsdr.conf')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  git describe --long --tags |
    sed 's/\([^-]*-g\)/r\1/;s/-/./g' |
    sed s/v//
}

build() {
  cd "${srcdir}/${pkgname%%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DDETACH_KERNEL_DRIVER=ON -Wno-dev ../
  make
}

package() {
  cd "${srcdir}/${pkgname%%-git}/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/${pkgname%%-git}/rtl-sdr.rules" \
    "$pkgdir/usr/lib/udev/rules.d/10-rtl-sdr.rules"
  install -Dm644 "$srcdir/rtlsdr.conf" \
    "$pkgdir/usr/lib/modprobe.d/rtlsdr.conf"

  install -dm755 "${pkgdir}/usr/share/man/man1"
  install -m644 "${srcdir}/${pkgname%%-git}/debian/"{rtl_adsb,rtl_eeprom,rtl_fm,rtl_power,rtl_sdr,rtl_tcp,rtl_test}".1" \
    "${pkgdir}/usr/share/man/man1/"
}

sha256sums=('SKIP'
  '678ecf05c85e79f29048c7093aee18c90e0e50dcd47ca61d842938b608ef3215')
