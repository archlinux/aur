pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
pkgdesc="Cartesi Machine emulator for RISC-V Linux systems"
pkgver=0.19.0
pkgrel=4
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator_ver=0.19.0-alpha2
_pkgver_linux=0.20.0
_pkgver_linux_kernel=6.5.13-ctsi-1-v${_pkgver_linux}
_pkgver_tools=0.17.0-test2
source=("machine-emulator-${_pkgver_emulator_ver}.tar.gz::https://github.com/cartesi/machine-emulator/archive/v$_pkgver_emulator_ver.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator_ver}/add-generated-files.diff"
        "https://github.com/cartesi/machine-linux-image/releases/download/v${_pkgver_linux}/linux-${_pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-guest-tools/releases/download/v${_pkgver_tools}/rootfs-tools-v${_pkgver_tools}.ext2")
sha256sums=('ccfc1027c2701e2506248926e32e64fe7b33e725ee54e394ddd932ee82e30997'
            'a892e2d9f5c331f5e80bcb5db4133e7db625aa4d14ffdf9467b75c4c34d1744f'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '293f377b0cb32cc477ef2c71be9430bab3a25d54eb0ab9aff07a4e6fac6aa829')

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

  install -Dm644 rootfs-tools-v${_pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
}

package_cartesi-machine-linux-image() {
  pkgdesc="Cartesi Machine guest Linux kernel image"

  install -Dm644 linux-${_pkgver_linux_kernel}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
}

package_cartesi-machine() {
  pkgdesc="Cartesi Machine (meta-package)"
  depends=(cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
}
