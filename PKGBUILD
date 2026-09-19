# Maintainer: Empyrealm <realminc.depravity737@passinbox.com>
pkgname=oa-sdk-git
pkgver=0.8.3.r0.gf9c97de
pkgrel=1
pkgdesc="OA SDK — runnable Rust tutorials, examples, benchmarks, and applications (git version)"
arch=('x86_64')
url="https://github.com/realminc/oa"
license=('BUSL-1.1')
depends=('alsa-lib' 'vulkan-icd-loader')
provides=("oa-sdk=${pkgver}")
conflicts=('oa-sdk')
# NOTE: `slangc` comes from shader-slang, NOT Arch's `slang` (the S-Lang interpreter).
# Fetch the pinned upstream release, matching OA's CI.
makedepends=('clang' 'git' 'pkgconf' 'python' 'rust' 'spirv-tools')
_slangver=2026.5.2
source=("git+https://github.com/realminc/oa.git"
        "slang-${_slangver}-linux-x86_64.tar.gz::https://github.com/shader-slang/slang/releases/download/v${_slangver}/slang-${_slangver}-linux-x86_64.tar.gz")
sha256sums=('SKIP'
            'd4f93f5e541a42b6e5a75b82ac5f787077ec74d80227dbfc5963324a4e8efcf1')

pkgver() {
  cd oa
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd oa
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd oa
  export PATH="$srcdir/bin:$PATH"
  export AR=ar
  # makepkg enables LTO.  Native dependencies may therefore contain LLVM
  # bitcode, which requires lld rather than GNU ld when Cargo links examples.
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C link-arg=-fuse-ld=lld"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build -p oa --release --examples --frozen
  python3 tools/build/stage.py --clean --profile release
  python3 tools/build/stage.py --profile release
}

package() {
  cd oa
  while IFS= read -r -d '' executable; do
    relative="${executable#bin/release/sdk/}"
    install -Dm755 "$executable" "$pkgdir/usr/$relative"
  done < <(find bin/release/sdk -type f -perm -111 -print0)
  install -Dm644 README.md "$pkgdir/usr/share/doc/oa-sdk/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/doc/oa-sdk/LICENSE"
  install -Dm644 NOTICE.md "$pkgdir/usr/share/doc/oa-sdk/NOTICE.md"
}
