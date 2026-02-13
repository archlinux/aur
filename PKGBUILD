# Maintainer: kosa12 <kosa12@users.noreply.github.com>
pkgname=crtty-git
pkgver=0.1.3
pkgrel=1
pkgdesc="Post-processing shader framework for kitty terminal via LD_PRELOAD"
arch=('x86_64')
url="https://github.com/kosa12/CRTty"
license=('MIT')
depends=('glibc')
makedepends=('cargo' 'git')
provides=('crtty')
conflicts=('crtty')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd CRTty
  printf "%s.r%s.%s" \
    "$(grep '^version' Cargo.toml | head -1 | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd CRTty
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd CRTty
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --workspace
}

package() {
  cd CRTty
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 crtty.conf.example "$pkgdir/usr/share/doc/$pkgname/crtty.conf.example"
}
