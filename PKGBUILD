# Maintainer: Solara Linux <ash8820@proton.me>
# Based on CachyOS PKGBUILD

pkgname=solara-kernel
pkgver=7.0.3
pkgrel=1
pkgdesc="Solara Linux Kernel - CachyOS optimized, Solara branded"
arch=('x86_64')
url="https://github.com/ravecorelabs/solara"
license=('GPL2')
makedepends=('bc' 'bison' 'flex' 'kmod' 'libelf' 'openssl' 'pahole' 'perl' 'python' 'rust' 'rust-bindgen' 'xz' 'zstd' 'clang' 'llvm' 'lld' 'git')
depends=('coreutils' 'kmod' 'initramfs')
optdepends=('wireless-regdb: wireless regulatory database'
            'linux-firmware: firmware files'
            'modprobed-db: module tracking'
            'scx-sched: sched-ext schedulers')

source=('cachy-kernel::git+https://github.com/CachyOS/linux-cachyos.git#tag=v7.0.3-1')

sha256sums=('SKIP')

prepare() {
    cd cachy-kernel
    
    # Copy config from repo
    cp linux-cachyos/config arch/x86/config
    
    # Change to Solara branding
    scripts/config --set-str CONFIG_LOCALVERSION "-solara"
    scripts/config --set-str CONFIG_LOCALVERSION_AUTO "n"
    scripts/config --set-str CONFIG_DEFAULT_HOSTNAME "solara"
    
    # Apply Solara patches if any (create your own)
    # patch -p1 -i /path/to/solara-patches/xxx.patch
}

build() {
    cd cachy-kernel
    
    # Use clang for faster builds
    export CC=clang
    export CXX=clang++
    export LD=ld.lld
    
    make -j$(nproc) all
}

package() {
    cd cachy-kernel
    
    # Install kernel
    make INSTALL_PATH=/usr install
    
    # Install modules
    make INSTALL_MOD_PATH="$pkgdir" modules_install
    
    # Solara os-release
    mkdir -p "$pkgdir/usr/lib"
    cat > "$pkgdir/usr/lib/os-release" << 'EOF'
NAME="Solara Linux"
PRETTY_NAME="Solara Linux"
ID=solara
ID_LIKE=arch
BUILD_ID=rolling
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://solaralinux.org/"
BUG_REPORT_URL="https://github.com/ravecorelabs/solara/issues"
LOGO=solara
EOF
}