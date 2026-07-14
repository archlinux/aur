pkgname=caesium-image-compressor-git
pkgver=1.4.0.r4.g47e7085
pkgrel=1
pkgdesc="High-performance image compressor CLI written in Rust"
arch=('x86_64')
url="https://github.com/Lymphatus/caesium-clt"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
provides=('caesiumclt')
conflicts=('caesiumclt')
source=("git+https://github.com/Lymphatus/caesium-clt.git")
sha256sums=('SKIP')

pkgver() {
    cd caesium-clt
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd caesium-clt

  local ld_flag=""
  if command -v mold >/dev/null 2>&1; then
    ld_flag="-fuse-ld=mold"
  elif command -v ld.lld >/dev/null 2>&1; then
    ld_flag="-fuse-ld=lld"
  fi

  # Aggressive x86_64 Optimizations
  export RUSTFLAGS="\
    -C opt-level=3 \
    -C target-cpu=native \
    -C codegen-units=1 \
    -C embed-bitcode=yes \
    -C strip=symbols \
    -C relocation-model=pic \
    -C link-arg=-Wl,-O2 \
    -C link-arg=-fno-plt \
    -C link-arg=$ld_flag \
    -C llvm-args=--inline-threshold=1000 \
  "

  cargo build --release
}

package() {
    cd caesium-clt

    # Install binary
    install -Dm755 target/release/caesiumclt "$pkgdir/usr/bin/caesiumclt"

    # Install license
    if [[ -f LICENSE.md ]]; then
        install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
