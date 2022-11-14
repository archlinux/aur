# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=efifs-git
pkgver=1.9.r0.g3ac43bb
pkgrel=1
pkgdesc='Standalone EFI file system drivers (git version)'
arch=('any')
url='https://efi.akeo.ie/'
license=('GPL3')
makedepends=('git' 'mingw-w64-gcc' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib'
             'aarch64-linux-gnu-gcc' 'riscv64-linux-gnu-gcc')
provides=('efifs')
conflicts=('efifs')
source=('git+https://github.com/pbatard/efifs.git'
        'git+https://git.savannah.gnu.org/git/grub.git'
        'gnu-efi'::'git+https://git.code.sf.net/p/gnu-efi/code')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C efifs submodule init
    git -C efifs config --local submodule.grub.url "${srcdir}/grub"
    git -C efifs config --local submodule.gnu-efi.url "${srcdir}/gnu-efi"
    git -C efifs -c protocol.file.allow='always' submodule update
    
    patch -d efifs/grub -Np1 -i "${srcdir}/efifs/0001-GRUB-fixes.patch"
    
    cp -af efifs{,-ia32}
    cp -af efifs{,-arm}
    cp -af efifs{,-aa64}
    cp -af efifs{,-riscv64}
}

pkgver() {
    git -C efifs describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    unset -v CFLAGS
    unset -v MAKEFLAGS
    make -C efifs ARCH='x64'
    make -C efifs-ia32 ARCH='ia32'
    make -C efifs-arm ARCH='arm' CROSS_COMPILE='arm-none-eabi-'
    make -C efifs-aa64 ARCH='aa64' CROSS_COMPILE='aarch64-linux-gnu-'
    make -C efifs-riscv64 ARCH='riscv64' CROSS_COMPILE='riscv64-linux-gnu-'
}

package() {
    install -D -m644 efifs/src/*.efi -t "${pkgdir}/usr/lib/efifs-x64"
    install -D -m644 efifs-ia32/src/*.efi -t "${pkgdir}/usr/lib/efifs-ia32"
    install -D -m644 efifs-arm/src/*.efi -t "${pkgdir}/usr/lib/efifs-arm"
    install -D -m644 efifs-aa64/src/*.efi -t "${pkgdir}/usr/lib/efifs-aa64"
    install -D -m644 efifs-riscv64/src/*.efi -t "${pkgdir}/usr/lib/efifs-riscv64"
}
