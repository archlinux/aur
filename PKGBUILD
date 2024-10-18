pkgname=(cartesi-machine)
pkgver=0.18.1
pkgrel=2
pkgdesc='Cartesi Machine'
arch=(any)
options=(!lto)
url='https://cartesi.io/'
license=(LGPL)
depends=(lua)
optdepends=('lua-socket: GDB plugin support')
makedepends=(boost)
pkgver_emulator=${pkgver}
pkgver_linux=0.20.0
pkgver_linux_kernel=6.5.13-ctsi-1-v${pkgver_linux}
pkgver_tools=0.16.1
source=("machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/refs/tags/v${pkgver_emulator}.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/add-generated-files.diff"
        "https://github.com/cartesi/image-kernel/releases/download/v${pkgver_linux}/linux-${pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-emulator-tools/releases/download/v${pkgver_tools}/rootfs-tools-v${pkgver_tools}.ext2")
sha256sums=('2d6ca78881b0a218aa9460d5cc7af7be51f9971b163305d6191039719568b5c3'
            '5e239448f47fe33b9c13e6c4c9c605ac16b8663f396909cd57abd6e4b447f1c4'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '4db885fdb4f013922d8ea8474768148ac4d45460a4ef30aea823836ea72ffed9')

prepare() {
  cd machine-emulator-${pkgver_emulator}
  [ -f src/machine-c-version.h ] || patch -Np0 < ../add-generated-files.diff
}

build() {
  make -C machine-emulator-${pkgver_emulator}
}

package() {
  # emulator
  make -C machine-emulator-${pkgver_emulator} install PREFIX=/usr DESTDIR="${pkgdir}"
  # linux
  install -Dm644 linux-${pkgver_linux_kernel}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux-${pkgver_linux_kernel}.bin"
  ln -s linux-${pkgver_linux_kernel}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
  # rootfs
  install -Dm644 rootfs-tools-v${pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs-tools-v${pkgver_tools}.ext2"
  ln -s rootfs-tools-v${pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
}
