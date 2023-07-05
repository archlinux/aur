# Maintainer: myon <myon@myon98.net>
pkgname=qemu-screamer-git
pkgver=r99787.448771a270
pkgrel=1
pkgdesc="QEMU PowerPC with sound support for Macintosh emulation"
arch=('x86_64')
url='https://github.com/mcayland/qemu/tree/screamer'
license=('GPL2')
depends=('sdl2' 'libpulse' 'vte3' 'libslirp' 'dtc')
makedepends=('git' 'python' 'ninja')
optdepends=('qemu-common: for qemu-bridge-helper')
source=('git+https://github.com/mcayland/qemu.git#branch=screamer'
        'suppress-gcc13-warning.patch')
sha256sums=('SKIP'
            '6fe10a16301cb3e18aff8ff40e2b24b2cc91cfe523f5ccbdd3d7264a043dfbeb')

pkgver() {
    cd qemu
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # git submodules?
    mkdir -p build
    cd qemu
    patch -Np1 -i "${srcdir}/suppress-gcc13-warning.patch"
}

build() {
    cd build
    ../qemu/configure \
	--prefix=/usr \
	--with-suffix=qemuscreamer \
	--firmwarepath=share/qemuscreamer \
	--target-list=ppc-softmmu \
	--audio-drv-list=pa,sdl \
	--without-default-features \
	--enable-pa --enable-gtk --enable-sdl --enable-vte \
	--enable-slirp --enable-avx2
    make
}

package() {
    cd "${srcdir}/build"
    install -d "${pkgdir}/usr/bin"
    install qemu-system-ppc "${pkgdir}/usr/bin/qemuscreamer-system-ppc"
    install -d "${pkgdir}/usr/share/qemuscreamer"
    cd "${srcdir}/qemu"
    install -m644 pc-bios/openbios-ppc "${pkgdir}/usr/share/qemuscreamer/"
    install -m644 pc-bios/vgabios-stdvga.bin "${pkgdir}/usr/share/qemuscreamer/"
    install -m644 pc-bios/qemu_vga.ndrv "${pkgdir}/usr/share/qemuscreamer/"
}
