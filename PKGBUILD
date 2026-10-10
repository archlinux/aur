# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=efifs-git
pkgver=1.13.r0.g0f1b63b
pkgrel=1
pkgdesc='Standalone EFI file system drivers (git version)'
arch=('any')
url='https://efi.akeo.ie/'
license=('GPL-3.0-or-later')
makedepends=(
    'aarch64-linux-gnu-gcc'
    'git'
    'loongarch64-linux-gnu-gcc'
    'mingw-w64-gcc'
    'riscv64-linux-gnu-gcc')
provides=('efifs')
conflicts=('efifs')
source=('git+https://github.com/pbatard/EfiFs.git'
        'git+https://gitlab.freedesktop.org/gnu-grub/grub.git'
        'git+https://github.com/ncroxon/gnu-efi.git'
        '010-efifs-fix-loongarch64-gcc-arch.patch'
        '020-efifs-gnu-efi-remove-werror.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'cae208426ca4a6edea7e103e19fd2743f5acd48267bb38ece84e00bbe2ea1d2b'
            'e887dfe07a1ada3a22fa79308dac94976165fbcc4bd0bb76c91dc55f5121c912')

prepare() {
    git -C EfiFs submodule init
    git -C EfiFs config --local submodule.grub.url "${srcdir}/grub"
    git -C EfiFs config --local submodule.gnu-efi.url "${srcdir}/gnu-efi"
    git -C EfiFs -c protocol.file.allow='always' submodule update
    
    patch -d EfiFs/grub -Np1 -i "${srcdir}/EfiFs/0001-GRUB-fixes.patch"
    patch -d EfiFs/gnu-efi -Np1 -i "${srcdir}/EfiFs/0001-gnu-efi-fixes.patch"
    
    patch -d EfiFs -Np1 -i "${srcdir}/010-efifs-fix-loongarch64-gcc-arch.patch"
    patch -d EfiFs/gnu-efi -Np1 -i "${srcdir}/020-efifs-gnu-efi-remove-werror.patch"
    
    cp -af EfiFs{,-ia32}
    cp -af EfiFs{,-aa64}
    cp -af EfiFs{,-riscv64}
    cp -af EfiFs{,-loongarch64}
}

pkgver() {
    git -C EfiFs describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    unset -v CFLAGS
    unset -v MAKEFLAGS
    
    printf '%s\n' '  -> building for x64...'
    make -C EfiFs ARCH='x64'
    
    printf '%s\n' '  -> building for ia32...'
    make -C EfiFs-ia32 ARCH='ia32'
    
    printf '%s\n' '  -> building for aa64...'
    make -C EfiFs-aa64 ARCH='aa64' CROSS_COMPILE='aarch64-linux-gnu-'
    
    printf '%s\n' '  -> building for riscv64...'
    make -C EfiFs-riscv64 ARCH='riscv64' CROSS_COMPILE='riscv64-linux-gnu-'
    
    printf '%s\n' '  -> building for loongarch64...'
    make -C EfiFs-loongarch64 ARCH='loongarch64' CROSS_COMPILE='loongarch64-linux-gnu-'
}

package() {
    install -D -m644 EfiFs/src/*.efi -t "${pkgdir}/usr/lib/efifs-x64"
    install -D -m644 EfiFs-ia32/src/*.efi -t "${pkgdir}/usr/lib/efifs-ia32"
    install -D -m644 EfiFs-aa64/src/*.efi -t "${pkgdir}/usr/lib/efifs-aa64"
    install -D -m644 EfiFs-riscv64/src/*.efi -t "${pkgdir}/usr/lib/efifs-riscv64"
    install -D -m644 EfiFs-loongarch64/src/*.efi -t "${pkgdir}/usr/lib/efifs-loongarch64"
}
