pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
pkgdesc="Cartesi Machine emulator for RISC-V Linux systems"
pkgver=0.22.0
pkgrel=1
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator=$pkgver
_pkgver_linux=6.18.56-ctsi-1
_pkgver_tools=0.18.0
source=("machine-emulator-${_pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/v$_pkgver_emulator.tar.gz"
        "add-generated-files-${_pkgver_emulator}.diff::https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator}/add-generated-files.diff"
        "linux-${_pkgver_linux}.bin::https://github.com/cartesi/linux/releases/download/v${_pkgver_linux}/linux-${_pkgver_linux}.bin"
        "rootfs-tools-${_pkgver_tools}.ext2::https://github.com/cartesi/machine-guest-tools/releases/download/v${_pkgver_tools}/rootfs-tools.ext2")
sha256sums=('7e82de5bfe213b9ca821a65c79a59dc593fff47ed6e8cf5accf36e9bb7b913fe'
            'f9050dd452caf8762aad0b74b59d5601aa64f44433dc691edc254b6e3f90d168'
            'ad12ad141e639fb7b8ce0477dfbb7aa7a4d178222b06e0ce9b335a1c5230f0e1'
            '6c159937485c99f695021c4f2ea2a57bdadcf4e4bce8e71af5bee3bb9552802e')
prepare() {
  cd machine-emulator-${_pkgver_emulator}
  patch -Np1 < ../add-generated-files-${_pkgver_emulator}.diff
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

  install -Dm644 rootfs-tools-${_pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs-tools-${_pkgver_tools}.ext2"
  ln -s rootfs-tools-${_pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
}

package_cartesi-machine-linux-image() {
  pkgdesc="Cartesi Machine guest Linux kernel image"

  install -Dm644 linux-${_pkgver_linux}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux-${_pkgver_linux}.bin"
  ln -s linux-${_pkgver_linux}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
}

package_cartesi-machine() {
  pkgdesc="Cartesi Machine (meta-package)"
  depends=(cartesi-machine-emulator cartesi-machine-linux-image cartesi-machine-rootfs-image)
}
