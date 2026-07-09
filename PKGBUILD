# Maintainer: smiley <smiley@localhost>
pkgname=pass-fxa-git
pkgver=0.4.1.r0.g73ee86c
pkgrel=1
pkgdesc='Upload a password-store to Firefox Accounts'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/AuthenticSm1les/pass-fxa'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git')
depends=('glibc' 'pass')
conflicts=('pass-fxa')
provides=('pass-fxa')
source=("$pkgname::git+https://github.com/AuthenticSm1les/pass-fxa.git")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | grep host | awk '{print $2}')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C linker=gcc -C link-arg=-fuse-ld=bfd -C lto=off"
  export CARGO_PROFILE_RELEASE_LTO=false
  export CFLAGS="${CFLAGS/-flto=auto/}"
  export CFLAGS="${CFLAGS/-flto/}"
  cd "$pkgname"
  cargo build --frozen --release
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo test --frozen
}

package() {
  cd "$pkgname"
  install -Dm0755 target/release/pass-fxa "$pkgdir/usr/bin/pass-fxa"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
