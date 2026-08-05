pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
pkgdesc="Cartesi Machine emulator for RISC-V Linux systems"
pkgver=0.21.0
pkgrel=1
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator=$pkgver
_pkgver_linux_kernel=6.5.13-ctsi-2
_pkgver_linux_image=0.21.0
_pkgver_tools=0.18.0
source=("machine-emulator-${_pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/v$_pkgver_emulator.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator}/add-generated-files.diff"
        "https://github.com/cartesi/machine-linux-image/releases/download/v${_pkgver_linux_image}/linux-${_pkgver_linux_kernel}-v${_pkgver_linux_image}.bin"
        "https://github.com/cartesi/machine-guest-tools/releases/download/v${_pkgver_tools}/rootfs-tools.ext2")
sha256sums=('44fc83cb08a1907e66ab225ccf421b0fdad3f145be35b9a9ffe561d3563e3eda'
            '596c5e171cac2e784aef01a26d47d19964b8593f74e37e863e0fcc1c9446be23'
            '5c900060da2db2bfa84cd39cd9cd722988c83c42225f3cac55f2d3157e48f32f'
            '6c159937485c99f695021c4f2ea2a57bdadcf4e4bce8e71af5bee3bb9552802e')
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

  install -Dm644 linux-${_pkgver_linux_kernel}-v${_pkgver_linux_image}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
}

package_cartesi-machine() {
  pkgdesc="Cartesi Machine (meta-package)"
  depends=(cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
}
