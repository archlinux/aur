# Maintainer: Celestia Ludenberg <ash8820@proton.me>

pkgname=solara-kernel
pkgver=7.0.5
pkgrel=1
pkgdesc="Solara Linux Kernel - Compiled from Linux ZEN kernel source"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
keywords=('kernel' 'linux' 'zen' 'solara' 'solara-linux')
license=('GPL2')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb' 'linux-firmware' 'modprobed-db' 'scx-sched')
makedepends=('xz' 'zstd' 'bc' 'rsync' 'libelf' 'openssl' 'python' 'tar' 'gcc' 'make' 'patch' 'diffutils' 'git' 'curl' 'flex' 'bison' 'elfutils' 'inetutils' 'clang' 'lld' 'llvm')

source=("https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.5.tar.xz"
        "https://github.com/zen-kernel/zen-kernel/releases/download/v7.0.5-zen1/linux-v7.0.5-zen1.patch.zst")
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd linux-7.0.5
    tar -xf "${srcdir}/linux-v7.0.5-zen1.patch.zst"
    for patch in *.patch; do
        [ -f "$patch" ] && patch -p1 -N < "$patch" || true
    done
    make x86_64_defconfig
    sed -i 's/CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="-solara"/g' .config
    sed -i 's/CONFIG_DEFAULT_HOSTNAME=.*/CONFIG_DEFAULT_HOSTNAME="solara"/g' .config
}

build() {
    cd linux-7.0.5
    make -j$(nproc) CC=clang LLVM=1 bzImage
    make -j$(nproc) CC=clang LLVM=1 modules
}

package() {
    cd linux-7.0.5
    DESTDIR="${pkgdir}" make modules_install install
    cp arch/x86_64/boot/bzImage "${pkgdir}/boot/vmlinuz-solara"
}