pkgname=(cartesi-machine)
pkgver=0.18.0
pkgrel=2
pkgdesc='Cartesi Machine'
arch=(any)
options=(!lto)
url='https://cartesi.io/'
license=(LGPL)
depends=(lua)
optdepends=('lua-socket: GDB plugin support')
makedepends=(boost)
pkgver_emulator=0.18.0-test1
pkgver_linux=0.20.0
pkgver_linux_kernel=6.5.13-ctsi-1-v${pkgver_linux}
pkgver_tools=0.15.0
source=("machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/refs/tags/v${pkgver_emulator}.tar.gz"
        "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/add-generated-files.diff"
        "https://github.com/cartesi/image-kernel/releases/download/v${pkgver_linux}/linux-${pkgver_linux_kernel}.bin"
        "https://github.com/cartesi/machine-emulator-tools/releases/download/v${pkgver_tools}/rootfs-tools-v${pkgver_tools}.ext2")
sha256sums=('10b3157c89dce5366dda49a15d9f7c5293e4df081f679bd869ef8546d4104ac2'
            '5ddb29d3a0259f9295dc303110d5b24a880e3db19fe77b2a0a1a0a89d3cf8b71'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            'dee8f9b739814f0076cd629f1de98fd71a4b5bc57a417678f80422dc9ef85550')

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
