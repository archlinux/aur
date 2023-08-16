pkgname=cartesi-machine
#pkgver=0.15.0
pkgver=6c3b878925fd6e646616b2af4293cdf9f25af4e6
pkgrel=1
pkgdesc='Cartesi Machine'
arch=('any')
options=('!strip')
url='https://cartesi.io/'
license=('LGPL')
depends=(
  'glibc'
  'lua'
  'lua-dkjson'
  'lua-socket'
  'grpc'
  'protobuf'
  'crypto++'
  'libb64'
)
makedepends=(
  'base-devel'
  'wget'
  'rsync'
  'patchelf'
  'perl' # for shasum
  'boost'
  'nlohmann-json'
)
pkgver_emulator=${pkgver}
pkgver_grpc_interfaces=0.11.0
pkgver_defines=0.10.0
pkgver_rom=0.17.0
pkgver_rootfs=0.18.0
pkgver_tools=0.12.0
pkgver_kernel=0.17.0
pkgver_linux=5.15.63-ctsi-2-v${pkgver_kernel}

source=(
  "machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/6c3b878925fd6e646616b2af4293cdf9f25af4e6.tar.gz"
  "machine-emulator-defines-${pkgver_defines}.tar.gz::https://github.com/cartesi/machine-emulator-defines/archive/refs/tags/v${pkgver_defines}.tar.gz"
  "grpc-interfaces-${pkgver_grpc_interfaces}.tar.gz::https://github.com/cartesi/grpc-interfaces/archive/refs/tags/v${pkgver_grpc_interfaces}.tar.gz"
  https://github.com/cartesi/machine-emulator-rom/releases/download/v${pkgver_rom}/rom-v${pkgver_rom}.bin
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-${pkgver_linux}.bin
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-${pkgver_linux}.elf
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-nobbl-${pkgver_linux}.bin
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-headers-${pkgver_linux}.tar.xz
  https://github.com/cartesi/image-rootfs/releases/download/v${pkgver_rootfs}/rootfs-v${pkgver_rootfs}.ext2
  https://github.com/cartesi/machine-emulator-tools/releases/download/v${pkgver_tools}/machine-emulator-tools-v${pkgver_tools}.tar.gz
)
noextract=(
  "machine-emulator-tools-v${pkgver_tools}.tar.gz"
  "linux-headers-${pkgver_linux}.tar.xz"
)
sha256sums=('8256e4ef63917a51113390cefb34609c3ac61904f13eb8db70508b66977452f2'
            '3bb65d17259e567c0b51769ade4fc3babd5f7c79cc26f0eee281c6fb27eddbaf'
            'c61e2f72b86260ac6e5e1ee96ebea681cb0c6b9e541ecb0a2f10ca00a3417d4e'
            'a4eee43b1440c6d6cd1ffca6b9d9c64974ad2ab60ca669f404a3eff4eb671070'
            'bceb86f5b6d369792cd994489ac6112da6fafb6043417773fc907a2fadb49bf6'
            '4831a95f8b277dfa51627fe6d25c6aac171d421c4472d15e6803b8ca14390861'
            '768eda324910fbf11abb17d2e36868813998364142a9c790d127bd241a067499'
            'c30e39c48ebba7b4a42e128b2b1cedd8e44bdb8e69d417c7f30ab3bccd48aa4c'
            '326e09d201dba6331dbbe67eb2731e88531cc00ada79b6336c5755788d30c0ef'
            '27b7661ca7409104d811f2711bf7462c865d5747b6e7d1c887da665fa74d6d39')

prepare() {
  # grpc interfaces
  rsync -a grpc-interfaces-${pkgver_grpc_interfaces}/ machine-emulator-${pkgver_emulator}/lib/grpc-interfaces
  # defines
  rsync -a machine-emulator-defines-${pkgver_defines}/ machine-emulator-${pkgver_emulator}/lib/machine-emulator-defines
  # download third-party files
  make -C machine-emulator-${pkgver_emulator} downloads
}

build() {
  cd machine-emulator-${pkgver_emulator}
  # compile deps
  make dep
  # compile emulator
  make release=yes
}

package() {
  # install emulator
  make -C machine-emulator-${pkgver_emulator} install install-strip PREFIX=/usr DESTDIR="${pkgdir}"
  # install rom
  install -Dm644 "rom-v${pkgver_rom}.bin" "${pkgdir}/usr/share/cartesi-machine/images/rom-v${pkgver_rom}.bin"
  ln -s rom-v${pkgver_rom}.bin "${pkgdir}/usr/share/cartesi-machine/images/rom.bin"
  # install linux
  install -Dm644 "linux-${pkgver_linux}.bin" "${pkgdir}/usr/share/cartesi-machine/images/linux-${pkgver_linux}.bin"
  install -Dm644 "linux-${pkgver_linux}.elf" "${pkgdir}/usr/share/cartesi-machine/images/linux-${pkgver_linux}.elf"
  install -Dm644 "linux-nobbl-${pkgver_linux}.bin" "${pkgdir}/usr/share/cartesi-machine/images/linux-nobbl-${pkgver_linux}.bin"
  ln -s linux-${pkgver_linux}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
  ln -s linux-${pkgver_linux}.elf "${pkgdir}/usr/share/cartesi-machine/images/linux.elf"
  ln -s linux-${pkgver_linux}-nobbl.bin "${pkgdir}/usr/share/cartesi-machine/images/linux-nobbl.bin"
  # install rootfs
  install -Dm644 "rootfs-v${pkgver_rootfs}.ext2" "${pkgdir}/usr/share/cartesi-machine/images/rootfs-v${pkgver_rootfs}.ext2"
  ln -s rootfs-v${pkgver_rootfs}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
  # install tools
  mkdir -p "${pkgdir}/usr/share/cartesi-machine/riscv-tools/"
  install -Dm644 "machine-emulator-tools-v${pkgver_tools}.tar.gz" "${pkgdir}/usr/share/cartesi-machine/riscv-tools/machine-emulator-tools-v${pkgver_tools}.tar.gz"
  # install linux headers
  mkdir -p "${pkgdir}/usr/share/cartesi-machine/riscv-linux-headers/"
  install -Dm644 "linux-headers-${pkgver_linux}.tar.xz" "${pkgdir}/usr/share/cartesi-machine/riscv-linux-headers/linux-headers-${pkgver_linux}.tar.xz"
}
