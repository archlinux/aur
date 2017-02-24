# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>

pkgname=hifive1-sdk-git
pkgver=r94.b7c778c
pkgrel=1
pkgdesc="The Official SDK of the RISC-V-based HiFive Board"
depends=('libunistring>=0.9.7' 'flex-git')
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
    
    mkdir -p $pkgdir/opt/hifive1-sdk
    cp -r toolchain $pkgdir/opt/hifive1-sdk/
    cp -r bsp $pkgdir/opt/hifive1-sdk/
    cp -r software $pkgdir/opt/hifive1-sdk/
    cp Makefile $pkgdir/opt/hifive1-sdk/
}

pkgver() {
    cd $srcdir/freedom-e-sdk
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}
