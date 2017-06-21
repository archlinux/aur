# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>

pkgname=hifive1-sdk-git
pkgver=r159.261668c
pkgrel=1
pkgdesc="The Official SDK of the RISC-V-based HiFive1 Board (and Arty)"
depends=('guile2.0')
makedepends=('git')
arch=('x86_64')
source=("git+https://github.com/sifive/freedom-e-sdk.git")
url="https://www.sifive.com/"
license=("APACHE")
options=('!strip')
sha256sums=('SKIP')
install=hifive1-sdk.install

prepare() {
    cd $srcdir/freedom-e-sdk
    git submodule update --init --recursive

    # patch the guile 2.0 problem
    sed -i 's/medany \\/&\n --with-guile=guile-2.0 \\/' ./Makefile
}

build() {
    cd $srcdir/freedom-e-sdk
    unset CPPFLAGS
    make tools
}

package() {
	set -x
    cd $srcdir/freedom-e-sdk
    
    mkdir -p $pkgdir/opt
    cp -r openocd $pkgdir/opt/hifive1-sdk
    cp -r FreedomStudio $pkgdir/opt/hifive1-sdk
    mkdir -p $pkgdir/opt/hifive1-sdk/work/build/riscv-gnu-toolchain/riscv64-unknown-elf/
    cp -r work/build/openocd $pkgdir/opt/hifive1-sdk/work/build/
    cp -r work/build/riscv-gnu-toolchain/riscv64-unknown-elf/prefix $pkgdir/opt/hifive1-sdk/work/build/riscv-gnu-toolchain/riscv64-unknown-elf/

    mkdir -p $pkgdir/usr/share/hifive1-sdk
    cp -r bsp $pkgdir/usr/share/hifive1-sdk/
    cp -r software $pkgdir/usr/share/hifive1-sdk/
    cp Makefile $pkgdir/usr/share/hifive1-sdk/.Makefile
    cat $pkgdir/usr/share/hifive1-sdk/.Makefile | sed "s/^builddir.*/builddir := \/opt\/hifive1-sdk\/work\/build/" > $pkgdir/usr/share/hifive1-sdk/Makefile
    mv $pkgdir/usr/share/hifive1-sdk/bsp/env/common.mk $pkgdir/usr/share/hifive1-sdk/bsp/env/.common.mk
    cat $pkgdir/usr/share/hifive1-sdk/bsp/env/.common.mk | sed "s/^TOOL_DIR.*/TOOL_DIR = \/opt\/hifive1-sdk\/work\/riscv-gnu-toolchain\/riscv64-unknown-elf\/prefix\/bin/" > $pkgdir/usr/share/hifive1-sdk/bsp/env/common.mk
}

pkgver() {
    cd $srcdir/freedom-e-sdk
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
