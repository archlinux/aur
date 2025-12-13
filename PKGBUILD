# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=fan-control
_app_id="io.github.wiiznokes.$pkgname"
pkgver=25.11.0
pkgrel=1
epoch=1
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
checkdepends=('appstream')
source=("git+https://github.com/wiiznokes/fan-control.git#tag=$pkgver"
        'git+https://github.com/wiiznokes/libsensors.git')
sha256sums=('5617fa836bb0799931f55af910dcd487bf41dde76aa2cee5eb2993383e0a777c'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.hardware/libsensors.url "$srcdir/libsensors"
  git -c protocol.file.allow=always submodule update

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Don't run `git submodule update`
  sed -i '/submodule/d' justfile
}

build() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just libsensors
  just build-release
}

check() {
  cd "$pkgname"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just test
  just metainfo-check
}

package() {
  cd "$pkgname"
  just rootdir="$pkgdir/usr" install

  install -Dm644 "res/linux/60-$pkgname.rules" -t \
    "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 res/linux/*.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
