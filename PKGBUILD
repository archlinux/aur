pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
pkgdesc="Cartesi Machine emulator for RISC-V Linux systems"
pkgver=0.20.0
pkgrel=1
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator=$pkgver
_pkgver_linux=0.20.0
_pkgver_linux_kernel=6.5.13-ctsi-1-v${_pkgver_linux}
_pkgver_tools=0.17.2
source=("machine-emulator-${_pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/v$_pkgver_emulator.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator}/add-generated-files.diff"
        "https://github.com/cartesi/machine-linux-image/releases/download/v${_pkgver_linux}/linux-${_pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-guest-tools/releases/download/v${_pkgver_tools}/rootfs-tools.ext2")
sha256sums=('3746abb72d45dd2388f79fc24b048fe306db8e1f9f7e072176e51b95c4453949'
            'd9c2afcefc2759e7cd37bbedc83d54c81515f0fddb671103b489b8789aee33bb'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '675a49e3c9bada29f25d5b559707b34553b94280c03f44ccb8203c2cf453b541')
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
