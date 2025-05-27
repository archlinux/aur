pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
pkgdesc="Cartesi Machine emulator for RISC-V Linux systems"
pkgver=0.19.0
pkgrel=7
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator=$pkgver
_pkgver_linux=0.20.0
_pkgver_linux_kernel=6.5.13-ctsi-1-v${_pkgver_linux}
_pkgver_tools=0.17.1
source=("machine-emulator-${_pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/v$_pkgver_emulator.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator}/add-generated-files.diff"
        "https://github.com/cartesi/machine-linux-image/releases/download/v${_pkgver_linux}/linux-${_pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-guest-tools/releases/download/v${_pkgver_tools}/rootfs-tools.ext2")
sha256sums=('1a33fb7e0dd7030656ddbb214dcd2f5a569f64e906edb20f149b66b34e1e0dd3'
            'a892e2d9f5c331f5e80bcb5db4133e7db625aa4d14ffdf9467b75c4c34d1744f'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            'e5d1f7c449e24314e0bcea1446e1c754a737aa7685b8c8d285a5e7eefa6b8044')

prepare() {
  cd machine-emulator-${_pkgver_emulator}
  patch -Np1 < ../add-generated-files.diff
}

build() {
  make -C machine-emulator-${_pkgver_emulator}
}

package_cartesi-machine-emulator() {
  depends=(lua libslirp)
  optdepends=('lua-socket: GDB plugin support')

  make -C machine-emulator-${_pkgver_emulator} install PREFIX=/usr DESTDIR="${pkgdir}"
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
