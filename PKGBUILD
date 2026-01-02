# Maintainer: SoulHarsh007 <harsh.peshwani@outlook.com>

pkgname=cachy-chroot
pkgver=1.3.0
pkgrel=2
pkgdesc='Chroot helper for CachyOS'
arch=('x86_64')
groups=('cachyos')
license=(BSD-3-Clause)
url="https://github.com/CachyOS/cachy-chroot"
depends=('arch-install-scripts' 'util-linux')
optdepends=('btrfs-progs: for btrfs support' 'cryptsetup: for LUKS support' 'zfs-utils: for ZFS support')
makedepends=('git' 'cargo' 'lld' 'clang' 'llvm')
source=("git+${url}?signed#tag=${pkgver}")
b2sums=('b401824acfe0d77267329f574c964fe43ade2f599f9378e72746f7b347fc2ad341e08f7bc617587799200215c6e7ce69106764fe9d02357c00c7b70b83bd7277')
validpgpkeys=(
    2BDE2DF6DDC89DBA55698CA4D06942E10F32FD49 # SoulHarsh007 <harsh.peshwani@outlook.com>
    6FE9632C37251BCE0E04551DBFDF8F508D7F0B79 # SoulHarsh007 (new signing key) <harsh.peshwani@outlook.com>
)

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}"
    
    # Compile with clang
    export AR=llvm-ar
    export CC=clang
    export CXX=clang++
    export NM=llvm-nm
    export RANLIB=llvm-ranlib
    
    export RUSTFLAGS="-Cembed-bitcode -C opt-level=3 -Ccodegen-units=1 -Clinker=clang -C link-arg=-flto -Clink-arg=-fuse-ld=/usr/bin/ld.lld"
    cargo build --release --frozen
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/cachy-chroot/LICENSE"
    install -Dm755 "target/release/cachy-chroot" "${pkgdir}/usr/bin/cachy-chroot"
}

# vim:set sw=2 sts=2 et:
