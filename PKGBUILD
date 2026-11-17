# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nix-init
pkgver=0.3.6
pkgrel=1
pkgdesc='Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more'
url='https://github.com/nix-community/nix-init'
license=('MPL-2.0')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'curl' 'bzip2' 'zlib' 'nurl' 'libgit2' 'sqlite')
makedepends=('cargo' 'spdx-license-list-data' 'zstd')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nix-init/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/nix-community/nix-init/raw/v$pkgver/LICENSE"
        get_nix_license.rs)
sha256sums=('48b310df53d59c162003934bed0f6e8d4232b37a32db24fb6b9b075eb24a4178'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '79ddce8a21a761f64011ad92c7de119571fce8c8ce7dbcda0d0802be370dfc12')
b2sums=('32d8284e9dd20cf111824b7d70eac66a957eefb4a1ea44dc1f132cbd5537552c54ffd6baedb5eaf57e346d74e583f49f05bc3f4e377ef882a7a0eabd3d182c6b'
        '385ec46b62788d2cfed32d1de03728fdf3f36f1b90f726e2412969918ddd2c1859b26b722bd5b3806252620409550da6b9cbc8ab8583c1cb140b3043e8606f8c'
        '8d5c749cda69c9d8dfdb9080774324fbe1a5190089c953f06b8700fbb80989e7db47c4e8a92e3d41f413e423b4b2fe6c1a8213c11a8113a177547a0879f79cb2')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  export ZSTD_SYS_USE_PKG_CONFIG=1
  export LIBGIT2_NO_VENDOR=1
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export GEN_ARTIFACTS="artifacts"

  mkdir -p data
  cargo run -p license-store-cache --frozen data/license-store-cache.zstd /usr/share/spdx/license-list-data/json/details

  cp "$srcdir/get_nix_license.rs" data/

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/nix-init

  install -Dm0644 -t "$pkgdir/usr/share/man/man1" artifacts/nix-init.1

  install -Dm0644 artifacts/nix-init.bash "$pkgdir/usr/share/bash-completion/completions/nix-init"
  install -Dm0644 artifacts/_nix-init "$pkgdir/usr/share/zsh/site-functions/_nix-init"
  install -Dm0644 artifacts/nix-init.fish "$pkgdir/usr/share/fish/vendor_completions.d/nix-init.fish"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
