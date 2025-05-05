pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
pkgdesc="Cartesi Machine emulator for RISC-V Linux systems"
pkgver=0.19.0
pkgrel=6
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator_ver=0.19.0-alpha4
_pkgver_linux=0.20.0
_pkgver_linux_kernel=6.5.13-ctsi-1-v${_pkgver_linux}
_pkgver_tools=0.17.0
source=("machine-emulator-${_pkgver_emulator_ver}.tar.gz::https://github.com/cartesi/machine-emulator/archive/v$_pkgver_emulator_ver.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator_ver}/add-generated-files.diff"
        "https://github.com/cartesi/machine-linux-image/releases/download/v${_pkgver_linux}/linux-${_pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-guest-tools/releases/download/v${_pkgver_tools}/rootfs-tools.ext2")
sha256sums=('2758abc942f651ea851bd6eceb37f7f33681f8edbf5c60b5e8cc74cace7bd06a'
            'a892e2d9f5c331f5e80bcb5db4133e7db625aa4d14ffdf9467b75c4c34d1744f'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '8eb9d03b2653fc6090caf4ae3fb49b44fe1ccd57d9903dd696c0a3024ea1a031')

prepare() {
  cd machine-emulator-${_pkgver_emulator_ver}
  patch -Np1 < ../add-generated-files.diff
}

build() {
  make -C machine-emulator-${_pkgver_emulator_ver}
}

package_cartesi-machine-emulator() {
  depends=(lua libslirp)
  optdepends=('lua-socket: GDB plugin support')

  make -C machine-emulator-${_pkgver_emulator_ver} install PREFIX=/usr DESTDIR="${pkgdir}"
}

package_cartesi-machine-rootfs-image() {
  pkgdesc="Cartesi Machine guest root filesystem image"

  install -Dm644 rootfs-tools.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
}

package_cartesi-machine-linux-image() {
  pkgdesc="Cartesi Machine guest Linux kernel image"

  install -Dm644 linux-${_pkgver_linux_kernel}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
}

package_cartesi-machine() {
  pkgdesc="Cartesi Machine (meta-package)"
  depends=(cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
}
