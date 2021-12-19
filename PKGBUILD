# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=ems-flasher-git
pkgver=r139.b88640a
pkgrel=1
pkgdesc='Utility to flash ROM images to the EMS USB 64 mbit gameboy flash cart on Linux'
url="https://github.com/mikeryan/ems-flasher"
license=("MIT")
arch=('i686' 'x86_64')
makedepends=('git')
depends=('libusb')
conflicts=('ems-flasher')
provides=('ems-flasher')
source=("git+https://github.com/mikeryan/ems-flasher.git")
md5sums=('SKIP')

pkgver() {
  cd ems-flasher
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/ems-flasher
  ./config.sh --prefix /usr
  sed -i '/^CFLAGS/ s/$/ -fcommon/' Makefile
  make
}

package() {
  cd "$srcdir"/ems-flasher
  install -d "$pkgdir"/usr/{bin,share/{man/man1,ems-flasher},lib/udev/rules.d}
  make BINDIR="$pkgdir"/usr/bin \
       DATADIR="$pkgdir"/usr/share/ems-flasher \
       MANDIR="$pkgdir"/usr/share/man \
       UDEVRULESDIR="" \
       install
  install -Dm644 50_ems_gb_flash.rules "${pkgdir}/usr/lib/udev/rules.d/50_ems_gb_flash.rules"
}
