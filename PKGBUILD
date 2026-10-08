# Maintainer: y0sif <https://github.com/y0sif>
# Contributor: graysky <graysky AT proton DOT me>
_pkgname=whisrs
pkgname=whisrs-git
pkgver=0.1.28.r32.g031a2ff
pkgrel=1
pkgdesc='Linux-first voice-to-text dictation tool, written in Rust'
arch=(x86_64)
url='https://github.com/y0sif/whisrs'
license=(MIT)
depends=(gcc-libs alsa-lib libxkbcommon)
makedepends=(git cargo clang cmake)
provides=($_pkgname)
conflicts=($_pkgname)
options=('!lto')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd $_pkgname

  install -Dm755 target/release/whisrs "$pkgdir/usr/bin/whisrs"
  install -Dm755 target/release/whisrsd "$pkgdir/usr/bin/whisrsd"

  install -Dm644 contrib/whisrs.1 "$pkgdir/usr/share/man/man1/whisrs.1"
  install -Dm644 contrib/whisrsd.1 "$pkgdir/usr/share/man/man1/whisrsd.1"

  install -Dm644 contrib/99-whisrs.rules "$pkgdir/usr/lib/udev/rules.d/99-whisrs.rules"
  install -Dm644 contrib/whisrs.service "$pkgdir/usr/lib/systemd/user/whisrs.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
