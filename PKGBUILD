# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fan-control
_app_id="io.github.wiiznokes.$pkgname"
pkgver=2024.7.30
pkgrel=2
pkgdesc="Control your fans with different behaviors"
arch=('x86_64')
url="https://github.com/wiiznokes/fan-control"
license=('MIT')
depends=('gcc-libs' 'hicolor-icon-theme' 'libxkbcommon' 'lm_sensors')
makedepends=('cargo' 'clang' 'git' 'just')
source=("git+https://github.com/wiiznokes/fan-control.git#tag=v$pkgver"
        'git+https://github.com/wiiznokes/libsensors.git')
sha256sums=('26ebbf7938b5b60ddf9e4064b0c170a2ac6e626d0fa2b26362b7a09a97921bd5'
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
