# Maintainer: SoulHarsh007 <harsh.peshwani@outlook.com>

pkgname=cachy-chroot
pkgver=1.2.1
pkgrel=1
pkgdesc='Chroot helper for CachyOS'
arch=('x86_64')
groups=('cachyos')
license=(BSD-3-Clause)
url="https://github.com/CachyOS/cachy-chroot"
depends=('arch-install-scripts' 'btrfs-progs' 'util-linux')
makedepends=('git' 'cargo' 'lld' 'clang' 'llvm')
source=("git+${url}?signed#tag=${pkgver}")
b2sums=('2a81e3d850817e1e015b703fbbb6af6322e1521febe02a81e9868e98ca67f11aac2a41326d4bf0012f416c7bb7434750d6168bcc22cb6e77f20b823feda534d9')
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
