# Maintainer: myon <myon@myon98.net>
pkgname=qemu-screamer-git
pkgver=r96011.c108debd27
pkgrel=2
pkgdesc="QEMU PowerPC with sound support for Macintosh emulation"
arch=('x86_64')
url='https://github.com/mcayland/qemu/tree/screamer'
license=('GPL2')
depends=('sdl2' 'libpulse' 'vte3' 'libslirp')
makedepends=('git' 'python' 'ninja')
source=('git+https://github.com/mcayland/qemu.git#branch=screamer')
sha256sums=('SKIP')

pkgver() {
    cd qemu
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # git submodules?
    mkdir build
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
	--enable-slirp=system --enable-avx2
    make
}

package() {
    cd build
    install -d "${pkgdir}/usr/bin"
    install qemu-system-ppc "${pkgdir}/usr/bin/qemuscreamer-system-ppc"
    install -d "${pkgdir}/usr/share/qemuscreamer"
    install -m644 pc-bios/openbios-ppc "${pkgdir}/usr/share/qemuscreamer/"
    install -m644 pc-bios/vgabios-stdvga.bin "${pkgdir}/usr/share/qemuscreamer/"
    install -m644 pc-bios/qemu_vga.ndrv "${pkgdir}/usr/share/qemuscreamer/"
}
