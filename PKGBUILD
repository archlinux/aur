# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fan-control
pkgver=0.1.3
pkgrel=1
pkgdesc="Control your fans with different behaviors"
arch=('x86_64')
url="https://github.com/wiiznokes/fan-control"
license=('MIT')
depends=('gcc-libs' 'lm_sensors')
makedepends=('cargo' 'clang' 'git' 'just')
source=("git+https://github.com/wiiznokes/fan-control.git#tag=v$pkgver"
        'git+https://github.com/wiiznokes/libsensors.git')
sha256sums=('8b5c26f15ae816adddd81a8b8fff2a660524650ec1d14c0af5f3420bf209840b'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.hardware/libsensors.url "$srcdir/libsensors"
  git -c protocol.file.allow=always submodule update

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Don't run `git submodule update`
  sed -i '/submodule/d' justfile
}

build() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just libsensors
  cargo build --release
}

check() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just test
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 resource/linux/desktop_entry.desktop \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 resource/linux/app_icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 resource/linux/metainfo.xml \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "resource/linux/60-$pkgname.rules" -t \
    "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
