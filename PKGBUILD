# Maintainer: SoulHarsh007 <harsh.peshwani@outlook.com>

pkgname=cachy-chroot
pkgver=1.2.0
pkgrel=1
pkgdesc='Chroot helper for CachyOS'
arch=('x86_64')
groups=('cachyos')
license=(BSD-3-Clause)
url="https://github.com/CachyOS/cachy-chroot"
depends=('arch-install-scripts' 'btrfs-progs' 'util-linux')
makedepends=('git' 'cargo' 'lld' 'clang' 'llvm')
source=("git+${url}?signed#tag=${pkgver}")
b2sums=('946be4354dc4b1aee8a8427180cea18906f1f3486597c83984e29135a9e4927fb621ee28b5d319d951bb08da92c0e5eea6f938e9c4af70e3d32f46ce1551dab0')
validpgpkeys=(
  2BDE2DF6DDC89DBA55698CA4D06942E10F32FD49 # SoulHarsh007 <harsh.peshwani@outlook.com>
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
