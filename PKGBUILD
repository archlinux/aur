# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fan-control
_app_id="io.github.wiiznokes.$pkgname"
pkgver=24.8.23
pkgrel=1
pkgdesc="Control your fans with different behaviors"
arch=('x86_64')
url="https://github.com/wiiznokes/fan-control"
license=('MIT')
depends=(
  'gcc-libs'
  'hicolor-icon-theme'
  'libxkbcommon'
  'lm_sensors'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'just'
)
source=("git+https://github.com/wiiznokes/fan-control.git#tag=$pkgver"
        'git+https://github.com/wiiznokes/libsensors.git')
sha256sums=('44162d8154b1c2e8215949ac1ac5e39498d759f38283f3121aedd63e9a4111d6'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.hardware/libsensors.url "$srcdir/libsensors"
  git -c protocol.file.allow=always submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Don't run `git submodule update`
  sed -i '/submodule/d' justfile
}

build() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just libsensors
  cargo build --release
}

check() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just test
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/${_app_id}"
  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 res/linux/desktop_entry.desktop \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 res/linux/app_icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 res/linux/metainfo.xml \
    "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
  install -Dm644 "res/linux//60-$pkgname.rules" -t \
    "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 res/linux/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
