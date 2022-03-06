# Maintainer: taotieren <admin@taotieren.com>

pkgname=gd32-dfu-utils
pkgver=0.9
pkgrel=1
epoch=
pkgdesc="Dfu-utils GD32 fork. Dfu-util - Device Firmware Upgrade Utilities"
arch=('x86_64')
url="https://github.com/riscv-mcu/gd32-dfu-utils"
license=('MIT')
groups=()
depends=('libusb')
makedepends=()
checkdepends=()
optdepends=(
  'python: dfuse-pack tool support'
  'python-intelhex: Intel HEX file format support'
)
provides=()
conflicts=(xfel-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6312461aab3650b0be8648a7afb9bbf2e63328defe80b25b6c2c85973b39f8f5')
#validpgpkeys=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
    install -Dm755 dfuse-pack.py "$pkgdir"/usr/bin/dfuse-pack
    install -Dm644 doc/40-dfuse.rules "$pkgdir"/usr/lib/udev/rules.d/40-gd32-dfuse.rules
    cd "$pkgdir"/usr/bin/
    for var in *; do mv "$var" "gd32-${var}"; done
    rm -rf "$pkgdir"/usr/share
}
