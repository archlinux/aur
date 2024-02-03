pkgname=cartesi-machine
pkgver=0.15.3
pkgrel=1
pkgdesc='Cartesi Machine'
arch=('any')
options=('!strip')
url='https://cartesi.io/'
license=('LGPL')
depends=(
  'lua'
  'lua-dkjson'
  'grpc'
  'protobuf'
  'crypto++'
  'libb64'
)
optdepends=(
  'lua-socket: GDB plugin support'
)
makedepends=(
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
  "machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/refs/tags/v${pkgver_emulator}.tar.gz"
  "uarch-ram-v${pkgver_emulator}.bin::https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/uarch-ram.bin"
  "machine-emulator-defines-${pkgver_defines}.tar.gz::https://github.com/cartesi/machine-emulator-defines/archive/refs/tags/v${pkgver_defines}.tar.gz"
  "grpc-interfaces-${pkgver_grpc_interfaces}.tar.gz::https://github.com/cartesi/grpc-interfaces/archive/refs/tags/v${pkgver_grpc_interfaces}.tar.gz"
  "mongoose-7.9.tar.gz::https://github.com/cesanta/mongoose/archive/refs/tags/7.9.tar.gz"
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
  "mongoose-7.9.tar.gz"
)
sha256sums=('ff540875355c623832740957233696bb4c382565bfcfa536c5f100d6b88fa396'
            '30b172db53908827af6b25ebcc33d514a7ed33d7f36a3e2b992000f87510050c'
            '3bb65d17259e567c0b51769ade4fc3babd5f7c79cc26f0eee281c6fb27eddbaf'
            'c61e2f72b86260ac6e5e1ee96ebea681cb0c6b9e541ecb0a2f10ca00a3417d4e'
            '09d456350cca0895e52ea269a3b3c25dae2ff4cc374a9ed90867594042af2277'
            'a4eee43b1440c6d6cd1ffca6b9d9c64974ad2ab60ca669f404a3eff4eb671070'
            'bceb86f5b6d369792cd994489ac6112da6fafb6043417773fc907a2fadb49bf6'
            '4831a95f8b277dfa51627fe6d25c6aac171d421c4472d15e6803b8ca14390861'
            '768eda324910fbf11abb17d2e36868813998364142a9c790d127bd241a067499'
            'c30e39c48ebba7b4a42e128b2b1cedd8e44bdb8e69d417c7f30ab3bccd48aa4c'
            '326e09d201dba6331dbbe67eb2731e88531cc00ada79b6336c5755788d30c0ef'
            '27b7661ca7409104d811f2711bf7462c865d5747b6e7d1c887da665fa74d6d39')

prepare() {
  # copy grpc interfaces
  cp -r grpc-interfaces-${pkgver_grpc_interfaces}/. machine-emulator-${pkgver_emulator}/lib/grpc-interfaces
  # copy defines
  cp -r machine-emulator-defines-${pkgver_defines}/. machine-emulator-${pkgver_emulator}/lib/machine-emulator-defines
  # copy third-party sources
  mkdir -p machine-emulator-${pkgver_emulator}/third-party/downloads/
  cp mongoose-7.9.tar.gz machine-emulator-${pkgver_emulator}/third-party/downloads/7.9.tar.gz
}

build() {
  export CFLAGS="${CFLAGS} -DMG_ENABLE_LOG=0" # to remove references to $srcdir
  export CXXFLAGS="${CXXFLAGS} -Wno-unused-parameter" # fix warnings

  cd machine-emulator-${pkgver_emulator}
  # compile deps
  make dep
  # compile emulator
  make release=yes
}

package() {
  # install emulator
  make -j1 -C "machine-emulator-${pkgver_emulator}" install-emulator install-strip PREFIX="/usr" DESTDIR="${pkgdir}"
  # install rom
  install -Dm644 "rom-v${pkgver_rom}.bin" "${pkgdir}/usr/share/cartesi-machine/images/rom-v${pkgver_rom}.bin"
  ln -s rom-v${pkgver_rom}.bin "${pkgdir}/usr/share/cartesi-machine/images/rom.bin"
  # install uarch ram
  install -Dm644 "uarch-ram-v${pkgver_emulator}.bin" "${pkgdir}/usr/share/cartesi-machine/images/uarch-ram-v${pkgver_emulator}.bin"
  ln -s uarch-ram.bin "${pkgdir}/usr/share/cartesi-machine/images/uarch-ram.bin"
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

