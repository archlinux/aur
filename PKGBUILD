# Maintainer: myon <myon@myon98.net>
pkgname=qemu-macm68k-git
pkgver=r90498.898eade90c
pkgrel=1
pkgdesc="QEMU m68k for Macintosh emulation"
arch=('x86_64')
url='https://gitlab.com/mcayland/qemu/-/tree/q800.upstream'
license=('GPL2')
depends=('sdl2' 'libpulse' 'vte3' 'libslirp')
makedepends=('git' 'python' 'ninja')
source=('git+https://gitlab.com/mcayland/qemu.git#branch=q800.upstream')
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
	--with-suffix=qemumacm68k \
	--firmwarepath=share/qemumacm68k \
	--target-list=m68k-softmmu \
	--audio-drv-list=pa,sdl \
	--without-default-features \
	--enable-gtk --enable-sdl --enable-vte \
	--enable-slirp=system --enable-avx2 \
        --disable-werror
    make
}

package() {
    cd build
    install -d "${pkgdir}/usr/bin"
    install qemu-system-m68k "${pkgdir}/usr/bin/qemumacm68k-system-m68k"
#    install -d "${pkgdir}/usr/share/qemumacm68k"
#    install -m644 pc-bios/openbios-ppc "${pkgdir}/usr/share/qemumacm68k/"
#    install -m644 pc-bios/vgabios-stdvga.bin "${pkgdir}/usr/share/qemumacm68k/"
}
