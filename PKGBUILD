# Maintainer: LekKit <github.com/LekKit>

pkgname=rvvm
pkgver=0.5_r831.b632d73
pkgrel=1
pkgdesc="The RISC-V Virtual Machine"
arch=('x86_64' 'aarch64' 'riscv64' 'riscv' 'ppc' 'i386' 'i686' 'pentium4' 'arm' 'armv7h' 'armv6h')
url="https://github.com/LekKit/RVVM/"
options=(!strip staticlibs)
license=('GPL3')
depends=('libx11' 'libxext')
makedepends=('git' 'make' 'gcc')
provides=('rvvm' 'librvvm')
conflicts=('rvvm' 'librvvm')
source=("$pkgname::git+https://github.com/LekKit/RVVM.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "0.5_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    # RVVM build system knows better
    unset CFLAGS
    unset LDFLAGS
    make BUILDDIR=build BINARY=rvvm_cli lib all
}

package() {
    cd $pkgname
    install -Dm644 LICENSE-GPL      $pkgdir/usr/share/licenses/rvvm/LICENSE-GPL
    install -Dm644 LICENSE-MPL      $pkgdir/usr/share/licenses/rvvm/LICENSE-MPL
    install -Dm644 src/rvvmlib.h    $pkgdir/usr/include/rvvmlib.h
    install -d                      $pkgdir/usr/include/rvvm/devices
    install -Dm644 src/devices/*.h  $pkgdir/usr/include/rvvm/devices
    install -Dm755 build/rvvm_cli   $pkgdir/usr/bin/rvvm
    install -Dm755 build/librvvm.so $pkgdir/usr/lib/librvvm.so
    install -Dm755 build/librvvm.a  $pkgdir/usr/lib/librvvm.a
}
