# Maintainer: gmes78 <gmes.078 at gmail dot com>

pkgname=ret-sync-ghidra-git
pkgver=r54.ba51775
pkgrel=1
pkgdesc="Set of plugins that help to synchronize a debugging session with a disassembler - Ghidra plugin"
arch=(any)
url="https://github.com/bootleg/ret-sync"
license=('GPL')
provides=("ret-sync-ghidra")
conflicts=("ret-sync-ghidra")

depends=('ghidra' 'java-environment>=11')
makedepends=('git' 'gradle')
optdepends=('ret-sync-gdb: GDB integration')

source=('git+https://github.com/bootleg/ret-sync')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/ret-sync"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/ret-sync/ext_ghidra"
    gradle -PGHIDRA_INSTALL_DIR=/opt/ghidra jar
}

package() {
    cd "$srcdir/ret-sync/ext_ghidra"
    mkdir -p "$pkgdir/opt/ghidra/Extensions/Ghidra/retsync"

    cp -R data/ ghidra_scripts/ lib/ Module.manifest extension.properties "$pkgdir/opt/ghidra/Extensions/Ghidra/retsync/"
    cp build/libs/retsync.jar "$pkgdir/opt/ghidra/Extensions/Ghidra/retsync/lib/retsync.jar"

    sed -i 's/@extname@/retsync/' "$pkgdir/opt/ghidra/Extensions/Ghidra/retsync/extension.properties"
    GHIDRA_VERSION=$(pacman -Q ghidra | cut -d ' ' -f2 | cut -d '-' -f1 | cut -d '.' -f-2)  # returns '9.1' from 'ghidra 9.1.2-1'
    sed -i "s/@extversion@/$GHIDRA_VERSION/" "$pkgdir/opt/ghidra/Extensions/Ghidra/retsync/extension.properties"

    mkdir -p "$pkgdir/opt/ghidra/Ghidra/Extensions"
    ln -s ../../Extensions/Ghidra/retsync "$pkgdir/opt/ghidra/Ghidra/Extensions/retsync"
}
