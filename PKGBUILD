# Maintainer: NeuroMarshal <148905931+NeuroMarshal@users.noreply.github.com>

pkgname=timedated-shim
pkgver=0.1.0
pkgrel=3
pkgdesc='Portable org.freedesktop.timedate1 service for non-systemd Linux'
arch=('x86_64')
url='https://github.com/NeuroMarshal/timedated-shim'
license=('GPL-3.0-or-later')
depends=('dbus' 'gcc-libs' 'glibc' 'polkit' 'procps-ng' 'tzdata' 'util-linux')
makedepends=('cargo')
provides=('timedated')
conflicts=('openrc-settingsd')
install=timedated-shim.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname-$pkgver-vendor.tar.zst::$url/releases/download/v$pkgver/$pkgname-$pkgver-vendor.tar.zst"
)
sha256sums=(
  'ef3269be6a1cef4d7e641b4ed3c01c696379cbc559c29fe69e23bdf334a85f82'
  'd0748213690f2ebdd20fd961d8aa0aba3060f169bad745fd8311ee30b7a5aabc'
)

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export CARGO_NET_OFFLINE=true
  cargo build --frozen --offline --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  export CARGO_NET_OFFLINE=true
  cargo test --frozen --offline
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" \
    "$pkgdir/usr/lib/$pkgname"
  install -Dm644 "data/org.freedesktop.timedate1.service" \
    "$pkgdir/usr/share/dbus-1/system-services/org.freedesktop.timedate1.service"
  install -Dm644 "data/org.freedesktop.timedate1.conf" \
    "$pkgdir/usr/share/dbus-1/system.d/org.freedesktop.timedate1.conf"
  install -Dm644 "data/org.freedesktop.timedate1.policy" \
    "$pkgdir/usr/share/polkit-1/actions/org.freedesktop.timedate1.policy"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
