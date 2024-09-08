# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=nix-init
pkgver=0.3.2
pkgrel=1
pkgdesc='Generate Nix packages from URLs with hash prefetching, dependency inference, license detection, and more'
url='https://github.com/nix-community/nix-init'
license=('MPL-2.0')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'curl' 'bzip2' 'zlib' 'nurl' 'libgit2' 'sqlite')
makedepends=('cargo' 'spdx-license-list-data' 'zstd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nix-init/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/nix-community/nix-init/raw/v$pkgver/LICENSE"
        get_nix_license.rs)
sha256sums=('870d50cfecac29f7622c3d84b82faabef4f710bcdb0a895c5bac829a4b255b79'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            '79ddce8a21a761f64011ad92c7de119571fce8c8ce7dbcda0d0802be370dfc12')
b2sums=('835f002918b571e753cfd3db85aed94426042dae8067d702cd43007cb31e1d2bdd3cf08be85de6f6b2e6f65cd4937db4bcc21ebc5e5619bdb99676ba2c2cb14f'
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
