# Maintainer: Celestia Ludenberg <ash8820@proton.me>

pkgname=solara-kernel-headers
pkgver=7.0.5
pkgrel=zen1
pkgdesc="Solara Linux Kernel headers - for building external kernel modules"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
license=('GPL2')
depends=('solara-kernel')
makedepends=('xz' 'bc' 'rsync' 'libelf' 'openssl' 'python' 'tar' 'gcc' 'make' 'patch' 'diffutils' 'git' 'curl' 'flex' 'bison' 'elfutils' 'clang' 'llvm')

source=("https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-7.0.5.tar.xz")
sha256sums=('SKIP')

prepare() {
    cd linux-7.0.5
    curl -sL "https://github.com/zen-kernel/zen-kernel/releases/download/v2.0/7.0.5/linux-v7.0.5-zen1.patch.zst" -o /tmp/zen.patch.zst
    tar -xf /tmp/zen.patch.zst
    for patch in *.patch; do
        [ -f "$patch" ] && patch -p1 -N < "$patch" || true
    done
    make x86_64_defconfig
}

build() {
    cd linux-7.0.5
    make -j$(nproc) scripts
    make -j$(nproc) modules
}

package() {
    cd linux-7.0.5
    make INSTALL_HDR_PATH="${pkgdir}/usr" headers_install
}