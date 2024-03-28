pkgname=cartesi-machine
pkgver=0.16.1
pkgrel=1
pkgdesc='Cartesi Machine'
arch=('any')
options=('!lto')
url='https://cartesi.io/'
license=('LGPL')
depends=(
  'lua'
)
optdepends=(
  'lua-socket: GDB plugin support'
  'lua-dkjson: rollup-memory-range support'
)
makedepends=(
  'boost'
)
pkgver_emulator=${pkgver}
pkgver_grpc_interfaces=0.16.0
pkgver_rootfs=0.18.0
pkgver_tools=0.14.1
pkgver_kernel=0.19.1
pkgver_linux=6.5.9-ctsi-1-v${pkgver_kernel}
pkgver_mongoose=7.12
pkgver_nlohmann_json=3.11.2

source=(
  "machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/refs/tags/v${pkgver_emulator}.tar.gz"
  "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/uarch-pristine-hash.c"
  "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/uarch-pristine-ram.c"
  "grpc-interfaces-${pkgver_grpc_interfaces}.tar.gz::https://github.com/cartesi/grpc-interfaces/archive/refs/tags/v${pkgver_grpc_interfaces}.tar.gz"
  "mongoose-${pkgver_mongoose}.tar.gz::https://github.com/cesanta/mongoose/archive/refs/tags/${pkgver_mongoose}.tar.gz"
  https://github.com/nlohmann/json/releases/download/v${pkgver_nlohmann_json}/json.hpp
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-${pkgver_linux}.bin
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-${pkgver_linux}-no-opensbi.bin
  https://github.com/cartesi/machine-emulator-tools/releases/download/v${pkgver_tools}/rootfs-tools-v${pkgver_tools}.ext2
)
noextract=(
  "mongoose-${pkgver_mongoose}.tar.gz"
)
sha256sums=('1c31eb394eefb2449e5e9fcfc183c49c3a7d1b3e9e661c847d8b50f16ca96922'
            'de0de18d46ad01162375235d0b8fba48cddea940323e59e68b1077f11831e6c9'
            '294251748f2cca53e04ef706441e0e323ecbea03250f197e66fe0160d7635635'
            '7ac1165ec41d841f86fe00fcfaa34114d2467c72ebeb776c0df5e85aa2eba837'
            '91e719e164816b349be3cb71293927f3f6abbe3fb02187e2d9b5e56f542c2063'
            '665fa14b8af3837966949e8eb0052d583e2ac105d3438baba9951785512cf921'
            '1dc36e05bf04d3fff097e51408556cef4d5ac09792e245b37c470d9188a4c173'
            'baa981a67b02c7f2be809b2ad21e4e189cf01353e8073f8edb27b6beec1d45b0'
            '7301ec8a9d3704ad65fce17626a6a36881e215fc8c769392d8a5d6e599fe1dc7')

prepare() {
  # copy third-party sources
  mkdir -p machine-emulator-${pkgver_emulator}/third-party/downloads/
  cp mongoose-${pkgver_mongoose}.tar.gz machine-emulator-${pkgver_emulator}/third-party/downloads/${pkgver_mongoose}.tar.gz
  cp json.hpp machine-emulator-${pkgver_emulator}/third-party/downloads/json.hpp
  # copy grpc interfaces
  cp -r grpc-interfaces-${pkgver_grpc_interfaces}/. machine-emulator-${pkgver_emulator}/lib/grpc-interfaces
  # copy uarch
  cp uarch-pristine-ram.c machine-emulator-${pkgver_emulator}/uarch/uarch-pristine-ram.c
  cp uarch-pristine-hash.c machine-emulator-${pkgver_emulator}/uarch/uarch-pristine-hash.c
}

build() {
  # compile emulator
  make -C machine-emulator-${pkgver_emulator} release=yes
}

package() {
  # install emulator
  make -C "machine-emulator-${pkgver_emulator}" install PREFIX="/usr" DESTDIR="${pkgdir}"
  # install linux
  install -Dm644 "linux-${pkgver_linux}.bin" "${pkgdir}/usr/share/cartesi-machine/images/linux-${pkgver_linux}.bin"
  install -Dm644 "linux-${pkgver_linux}-no-opensbi.bin" "${pkgdir}/usr/share/cartesi-machine/images/linux-${pkgver_linux}-no-opensbi.bin"
  ln -s linux-${pkgver_linux}.bin "${pkgdir}/usr/share/cartesi-machine/images/linux.bin"
  ln -s linux-${pkgver_linux}-no-opensbi.bin "${pkgdir}/usr/share/cartesi-machine/images/linux-no-opensbi.bin"
  # install rootfs
  install -Dm644 "rootfs-tools-v${pkgver_tools}.ext2" "${pkgdir}/usr/share/cartesi-machine/images/rootfs-tools-v${pkgver_tools}.ext2"
  ln -s rootfs-tools-v${pkgver_tools}.ext2 "${pkgdir}/usr/share/cartesi-machine/images/rootfs.ext2"
}
