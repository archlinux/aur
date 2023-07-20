# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=mountpoint-s3-git
pkgver=0.3.0.r404.7786053
pkgrel=1
pkgdesc="A simple, high-throughput file client for mounting an Amazon S3 bucket as a local file system."
url="https://github.com/awslabs/mountpoint-s3"
arch=("x86_64")
makedepends=("cargo" "git" "ripgrep")
depends=("fuse3")
provides=("mountpoint-s3")
conflicts=("mountpoint-s3")
license=("Apache")
source=("$pkgname::git+$url.git#branch=main")
sha256sums=("SKIP")

prepare() {
  cd "$pkgname"
  git submodule update --force --init --recursive --depth 1 --jobs 8
}

pkgver() {
  cd "$pkgname"
  local ver=$(rg -N -o -m 1 'version = "([0-9]+\.[0-9]+\.[0-9]+)' --replace '$1' "mountpoint-s3/Cargo.toml")
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/mount-s3" "$pkgdir/usr/bin/mount-s3"
}
