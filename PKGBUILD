# Maintainer: Celestia Ludenberg <ash8820@proton.me>

pkgname=solara-kernel-headers
pkgver=7.0.6
pkgrel=1
pkgdesc="Header files for the Solara Linux Kernel with ZEN + PRJC (CachyOS) patches and LLVM optimizations"
arch=('x86_64')
url="https://github.com/celestia-foundation/solara"
license=('GPL2')

keywords=(
  'linux' 'kernel' 'headers'
  'zen' 'prjc' 'cachyos'
  'performance' 'gaming'
  'lowlatency' 'clang' 'llvm'
  'solara'
)

provides=(
  "linux-headers=${pkgver}"
  "linux-zen-headers"
  "linux-cachyos-headers"
)

conflicts=(
  "linux-headers"
  "linux-zen-headers"
  "linux-cachyos-headers"
)

replaces=(
  "linux-headers"
  "linux-zen-headers"
  "linux-cachyos-headers"
)

depends=('solara-kernel')

makedepends=(
  'xz' 'bc' 'rsync' 'libelf' 'openssl' 'python' 'tar'
  'gcc' 'make' 'patch' 'diffutils' 'git' 'curl'
  'flex' 'bison' 'elfutils'
  'clang' 'llvm' 'zstd'
)

source=(
  "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${pkgver}.tar.xz"
  "https://github.com/zen-kernel/zen-kernel/releases/download/v${pkgver}-zen1/linux-v${pkgver}-zen1.patch.zst"
  "https://raw.githubusercontent.com/CachyOS/kernel-patches/master/7.0/sched/0001-prjc-cachy.patch"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "${srcdir}/linux-${pkgver}"

    # Apply Zen patch
    zstd -d -c "${srcdir}/linux-v${pkgver}-zen1.patch.zst" | patch -p1

    # Apply PRJC patch
    patch -Np1 -i "${srcdir}/0001-prjc-cachy.patch"

    make x86_64_defconfig
}

build() {
    cd "${srcdir}/linux-${pkgver}"
    make -j"$(nproc)" CC=clang LLVM=1 scripts
}

package() {
    cd "${srcdir}/linux-${pkgver}"
    make INSTALL_HDR_PATH="${pkgdir}/usr" headers_install
}
