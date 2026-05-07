# Maintainer: Solara Linux <ash8820@proton.me>
# Based on CachyOS PKGBUILD

pkgname=solara-kernel-headers
pkgver=7.0.3
pkgrel=1
pkgdesc="Solara Linux Kernel headers - for building external kernel modules"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
license=('GPL2')
makedepends=('bc' 'bison' 'flex' 'kmod' 'libelf' 'openssl' 'pahole' 'perl' 'python' 'rust' 'rust-bindgen' 'xz' 'zstd' 'clang' 'llvm' 'lld' 'git')
depends=('solara-kernel')

source=('cachy-kernel::git+https://github.com/CachyOS/linux-cachyos.git#tag=v7.0.3-1')

sha256sums=('SKIP')

prepare() {
    cd cachy-kernel
    
    cp linux-cachyos/config arch/x86/config
    
    scripts/config --set-str CONFIG_LOCALVERSION "-solara"
    scripts/config --set-str CONFIG_LOCALVERSION_AUTO "n"
    scripts/config --set-str CONFIG_DEFAULT_HOSTNAME "solara"
}

build() {
    cd cachy-kernel
    
    export CC=clang
    export CXX=clang++
    export LD=ld.lld
    
    make -j$(nproc) all
}

package() {
    cd cachy-kernel
    
    make INSTALL_HDR_PATH="$pkgdir/usr" headers_install
    
    for f in usr/include/*; do
        if [ -f "$f" ]; then
            gzip -n "$f"
            mv "$f" "${f}.gz"
        fi
    done
    
    find "$pkgdir/usr" -type f -name '*.h' -exec gzip -n {} \;
    
    install -Dm644 "$pkgdir/usr/include/linux/version.h" "$pkgdir/usr/include/linux/version.h.gz"
}