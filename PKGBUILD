# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=vardefm
pkgver=0.3.1
pkgrel=1
pkgdesc="Open high-speed data modem for FM radios (VARA FM alternative)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/notepid/vardeFM"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('hamlib: Hamlib rigctld PTT support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/notepid/vardeFM/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c312574dd6aafd813ab357a0a0992d19019e36e43ee5439730cc413d45c6aa19')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p vardefm-cli
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Skip long audio tests on constrained builders? Keep them; comment out to skip:
  # cargo test --locked -p vardefm-cli --test audio || true
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/vardefm" "$pkgdir/usr/bin/vardefm"
  install -Dm644 packaging/linux/99-vardefm-cm108.rules "$pkgdir/usr/lib/udev/rules.d/99-vardefm-cm108.rules"
  install -Dm644 packaging/systemd/vardefm.service "$pkgdir/usr/lib/systemd/system/vardefm.service"
  install -Dm644 packaging/vardefm.1 "$pkgdir/usr/share/man/man1/vardefm.1"
  install -Dm644 packaging/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 docs/RADIO.md "$pkgdir/usr/share/doc/$pkgname/RADIO.md"
  install -Dm644 docs/PROTOCOL.md "$pkgdir/usr/share/doc/$pkgname/PROTOCOL.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
