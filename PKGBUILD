# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=vkmsctl-git
pkgver=r46.0865cbf
pkgrel=1
pkgdesc='Command line tool to configure the VKMS Linux kernel driver'
url='https://github.com/JoseExposito/vkmsctl'
arch=('x86_64')
license=('MIT')
source=("git+$url.git")
sha1sums=('SKIP')
depends=()
makedepends=(git cargo)
conflicts=(vkmsctl)
provides=(vkmsctl)

pkgver() {
  # TODO: switch to tag once an initial release is shipped
  #git -C vkmsctl describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd vkmsctl
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd vkmsctl
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd vkmsctl
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd vkmsctl
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd vkmsctl
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/vkmsctl"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
