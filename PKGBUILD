pkgname=(cartesi-machine)
pkgver=0.18.0
pkgrel=4
pkgdesc='Cartesi Machine'
arch=(any)
options=(!lto)
url='https://cartesi.io/'
license=(LGPL)
depends=(lua)
optdepends=('lua-socket: GDB plugin support')
makedepends=(boost)
pkgver_emulator=0.18.0
pkgver_linux=0.20.0
pkgver_linux_kernel=6.5.13-ctsi-1-v${pkgver_linux}
pkgver_tools=0.16.0
source=("machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/refs/tags/v${pkgver_emulator}.tar.gz"
        "https://github.com/cartesi/machine-emulator/pull/226.patch"
        "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/add-generated-files.diff"
        "https://github.com/cartesi/image-kernel/releases/download/v${pkgver_linux}/linux-${pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-emulator-tools/releases/download/v${pkgver_tools}/rootfs-tools-v${pkgver_tools}.ext2")
sha256sums=('d12cdc7b3b15056f67a00d20cd8cd5111021c9ad921dc60421992d014e2f6f7c'
            '39edfedd6fced0d4f3f9579cfc968c6436ab0f3c67db6a24709a055dfb30e0a6'
            'da739e9c68b5e392e6dc634e0c1a2302b6d71e9548cc8cfb288e0ef59950062f'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '9bb25541c3e42e329d83cca40066772ac3d51491300bb32100127e04e4e6c531')

prepare() {
  cd machine-emulator-${pkgver_emulator}
  [ -f src/machine-c-version.h ] || patch -Np1 < ../add-generated-files.diff
  [ -f src/interpret-jump-table.h ] || patch -Np1 < ../226.patch
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
