# Maintainer: Celestia Ludenberg <ash8820@proton.me>

pkgname=solara-kernel
pkgver=7.0.5
pkgrel=1
pkgdesc="Solara Linux Kernel - Compiled from Linux ZEN kernel source"
arch=('x86_64')
url="https://github.com/celestia-foundation/solara"
keywords=('kernel' 'linux' 'zen' 'solara' 'solara-linux')
license=('GPL2')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb' 'linux-firmware' 'modprobed-db' 'scx-sched')
depends=('coreutils' 'kmod' 'initramfs' 'zstd')
optdepends=('wireless-regdb' 'linux-firmware' 'modprobed-db' 'scx-sched')
makedepends=('xz' 'bc' 'rsync' 'libelf' 'openssl' 'python' 'tar' 'gcc' 'make' 'patch' 'diffutils' 'git' 'curl' 'flex' 'bison' 'elfutils' 'inetutils' 'clang' 'lld' 'llvm')

source=("https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.5.tar.xz"
        "https://github.com/zen-kernel/zen-kernel/releases/download/v7.0.5-zen1/linux-v7.0.5-zen1.patch.zst")
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd linux-7.0.5
    
    # Check for .patch file (makepkg may have extracted .zst already)
    for patch in "${srcdir}"/*.patch; do
        [ -f "$patch" ] && patch -p1 -N < "$patch" || true
    done
    
    # Fallback: if no .patch, try decompressing .zst
    if [ ! -f "${srcdir}"/*.patch ] && [ -f "${srcdir}/linux-v7.0.5-zen1.patch.zst" ]; then
        zstd -d "${srcdir}/linux-v7.0.5-zen1.patch.zst" -o "${srcdir}/linux-v7.0.5-zen1.patch" -f
        for patch in "${srcdir}"/*.patch; do
            [ -f "$patch" ] && patch -p1 -N < "$patch" || true
        done
    fi
    
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
    
    KERNELRELEASE=$(make -s kernelrelease)
    
    make modules_install INSTALL_MOD_PATH="${pkgdir}"
    
    install -Dm644 arch/x86_64/boot/bzImage "${pkgdir}/boot/vmlinuz-solara"
    
    install -Dm644 .config "${pkgdir}/boot/config-solara"
    install -Dm644 System.map "${pkgdir}/boot/System.map-solara"
}