pkgname=(cartesi-machine cartesi-machine-emulator cartesi-machine-guest-linux cartesi-machine-guest-rootfs)
pkgver=0.19.0
pkgrel=2
arch=(any)
url='https://github.com/cartesi/machine-emulator'
license=(LGPL-3.0)
makedepends=(gcc make patch boost lua libslirp)
options=(!lto staticlibs)
_pkgver_emulator_commit=407fa8716f5a75e7f0519b66913b888200ce57b7
_pkgver_emulator_diff=0.18.2-test1
_pkgver_linux=0.20.0
_pkgver_linux_kernel=6.5.13-ctsi-1-v${_pkgver_linux}
_pkgver_tools=0.16.1
source=("machine-emulator-${_pkgver_emulator_commit}.tar.gz::https://github.com/cartesi/machine-emulator/archive/$_pkgver_emulator_commit.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${_pkgver_emulator_diff}/add-generated-files.diff"
        "https://github.com/cartesi/image-kernel/releases/download/v${_pkgver_linux}/linux-${_pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-emulator-tools/releases/download/v${_pkgver_tools}/rootfs-tools-v${_pkgver_tools}.ext2")
sha256sums=('659ac2162382c0bd8c8f15c27bcc4cdeee1a61772cfb44f7ae7583a90636edce'
            '8f513f065e94e6ab969cd27186421e28db0091b3a563cd87280c3bb51671669e'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '4db885fdb4f013922d8ea8474768148ac4d45460a4ef30aea823836ea72ffed9')

prepare() {
  cd machine-emulator-${_pkgver_emulator_commit}
  patch -Np1 < ../add-generated-files.diff
}

build() {
  make -C machine-emulator-${_pkgver_emulator_commit}
}

package_cartesi-machine-emulator() {
  pkgdesc="Cartesi Machine RISC-V system emulator"
  depends=(lua libslirp)
  optdepends=('lua-socket: GDB plugin support')

  make -C machine-emulator-${_pkgver_emulator_commit} install PREFIX=/usr DESTDIR="${pkgdir}"
}

package_cartesi-machine-guest-rootfs() {
  pkgdesc="Cartesi Machine guest root file system"

  install -Dm644 rootfs-tools-v${_pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs-tools-v${_pkgver_tools}.ext2"
  ln -s rootfs-tools-v${_pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
}

package_cartesi-machine-guest-linux() {
  pkgdesc="Cartesi Machine guest Linux kernel"

  install -Dm644 linux-${_pkgver_linux_kernel}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux-${_pkgver_linux_kernel}.bin"
  ln -s linux-${_pkgver_linux_kernel}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
}

package_cartesi-machine() {
  pkgdesc="Cartesi Machine metapackage providing its emulator and its standard guest operating system"
  depends=(cartesi-machine-emulator cartesi-machine-guest-linux cartesi-machine-guest-rootfs)
}
