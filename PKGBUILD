pkgname=cartesi-machine
pkgver=0.17.0
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
)
makedepends=(
  'boost'
)
pkgver_emulator=${pkgver}
pkgver_tools=0.15.0
pkgver_kernel=0.20.0
pkgver_linux=6.5.13-ctsi-1-v${pkgver_kernel}

source=(
  "machine-emulator-${pkgver_emulator}.tar.gz::https://github.com/cartesi/machine-emulator/archive/refs/tags/v${pkgver_emulator}.tar.gz"
  "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/uarch-pristine-hash.c"
  "https://github.com/cartesi/machine-emulator/releases/download/v${pkgver_emulator}/uarch-pristine-ram.c"
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-${pkgver_linux}.bin
  https://github.com/cartesi/image-kernel/releases/download/v${pkgver_kernel}/linux-${pkgver_linux}-no-opensbi.bin
  https://github.com/cartesi/machine-emulator-tools/releases/download/v${pkgver_tools}/rootfs-tools-v${pkgver_tools}.ext2
)
noextract=(
  "mongoose-${pkgver_mongoose}.tar.gz"
)
sha256sums=('2b3336eaa17bbacae749a46eb3af66e9745bc8708c86b3e5ba760a2e3482b831'
            '0a02547680c126f564e0c4e7dc7878880ec519c4a3e20c9bd5a987827bc6a9ab'
            '418c7d59fb889305ff4b182357afef1472d530fdb6e3c8c80ce78791e16426cb'
            '65dd100ff6204346ac2f50f772721358b5c1451450ceb39a154542ee27b4c947'
            '71914e452293bfecb2cf23162490dc105353024895f57c1bff8abb901fb2d27c'
            'dee8f9b739814f0076cd629f1de98fd71a4b5bc57a417678f80422dc9ef85550')

prepare() {
  make -C machine-emulator-${pkgver_emulator} dep
}

build() {
  make -C machine-emulator-${pkgver_emulator} relwithdebinfo=yes
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
