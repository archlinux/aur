# Maintainer: y0sif <https://github.com/y0sif>
pkgname=whisrs-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux-first voice-to-text dictation tool, written in Rust'
arch=('x86_64')
url='https://github.com/y0sif/whisrs'
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'libxkbcommon')
makedepends=('cargo' 'clang' 'cmake' 'git')
provides=('whisrs')
conflicts=('whisrs')
source=("git+https://github.com/y0sif/whisrs.git")
sha256sums=('SKIP')

pkgver() {
  cd whisrs
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
    || printf '0.1.0.r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd whisrs
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd whisrs
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-targets
}

check() {
  cd whisrs
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd whisrs

  install -Dm755 target/release/whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 target/release/whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
