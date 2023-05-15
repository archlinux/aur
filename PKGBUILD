# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=mountpoint-s3-git
pkgver=0.2.0.r295.e6b072f
_pkgver=0.2.0
pkgrel=1
pkgdesc="A simple, high-throughput file client for mounting an Amazon S3 bucket as a local file system."
url="https://github.com/awslabs/mountpoint-s3"
arch=("x86_64")
makedepends=("cargo" "git")
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
  printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
