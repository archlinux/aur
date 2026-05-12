# Maintainer: Celestia Ludenberg <ash8820@proton.me>

pkgname=solara-kernel
pkgver=7.0.6
pkgrel=1
pkgdesc="High-performance Linux kernel with ZEN + PRJC (CachyOS) patches and LLVM optimizations"
arch=('x86_64')
url="https://github.com/celestia-foundation/solara"
license=('GPL2')

keywords=(
  'linux' 'kernel' 'zen' 'prjc' 'sched'
  'cachyos' 'performance' 'gaming'
  'lowlatency' 'clang' 'llvm' 'solara'
)

provides=(
  "linux=${pkgver}"
  "linux-zen"
  "linux-cachyos"
  "linux-performance"
)

conflicts=(
  "linux"
  "linux-zen"
  "linux-cachyos"
  "linux-performance"
)

replaces=(
  "linux"
  "linux-zen"
  "linux-cachyos"
  "linux-performance"
)

depends=('coreutils' 'kmod' 'initramfs' 'zstd')
optdepends=('wireless-regdb' 'linux-firmware' 'modprobed-db' 'scx-sched')

makedepends=(
  'xz' 'bc' 'rsync' 'libelf' 'openssl' 'python' 'tar'
  'gcc' 'make' 'patch' 'diffutils' 'git' 'curl'
  'flex' 'bison' 'elfutils' 'inetutils'
  'clang' 'lld' 'llvm'
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

    # Apply PRJC (CachyOS) scheduler patch
    patch -Np1 -i "${srcdir}/0001-prjc-cachy.patch"

    # Default config
    make x86_64_defconfig

    # Branding
    sed -i 's/CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="-solara"/' .config
    sed -i 's/CONFIG_DEFAULT_HOSTNAME=.*/CONFIG_DEFAULT_HOSTNAME="solara"/' .config
}

build() {
    cd "${srcdir}/linux-${pkgver}"
    make -j"$(nproc)" CC=clang LLVM=1 bzImage
    make -j"$(nproc)" CC=clang LLVM=1 modules
}

package() {
    cd "${srcdir}/linux-${pkgver}"
    make modules_install INSTALL_MOD_PATH="${pkgdir}/usr"
    install -Dm644 arch/x86_64/boot/bzImage "${pkgdir}/boot/vmlinuz-solara"
    install -Dm644 .config "${pkgdir}/boot/config-solara"
    install -Dm644 System.map "${pkgdir}/boot/System.map-solara"
}
