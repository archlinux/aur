# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>

pkgname=hifive1-sdk-git
pkgver=r97.3a01ac1
pkgrel=1
pkgdesc="The Official SDK of the RISC-V-based HiFive1 Board (and Arty)"
depends=('flex-git' 'libunistring')
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
}

build() {
    cd $srcdir/freedom-e-sdk
    unset CPPFLAGS
    make tools
}

package() {
    cd $srcdir/freedom-e-sdk
    
    mkdir -p $pkgdir/opt
    cp -r toolchain $pkgdir/opt/hifive1-sdk

    mkdir -p $pkgdir/usr/share/hifive1-sdk
    cp -r bsp $pkgdir/usr/share/hifive1-sdk/
    cp -r software $pkgdir/usr/share/hifive1-sdk/
    cp Makefile $pkgdir/usr/share/hifive1-sdk/.Makefile
    cat $pkgdir/usr/share/hifive1-sdk/.Makefile | sed "s/^toolchain_dest.*/toolchain_dest := \/opt\/hifive1-sdk/" > $pkgdir/usr/share/hifive1-sdk/Makefile
    mv $pkgdir/usr/share/hifive1-sdk/bsp/env/common.mk $pkgdir/usr/share/hifive1-sdk/bsp/env/.common.mk
    cat $pkgdir/usr/share/hifive1-sdk/bsp/env/.common.mk | sed "s/^TOOL_DIR.*/TOOL_DIR = \/opt\/hifive1-sdk\/bin/" > $pkgdir/usr/share/hifive1-sdk/bsp/env/common.mk
}

pkgver() {
    cd $srcdir/freedom-e-sdk
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
