# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=vardefm-git
_pkgname=vardefm
pkgver=0.3.1.r1.g0351268
pkgrel=1
pkgdesc="Open high-speed data modem for FM radios (VARA FM alternative) — latest git"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/notepid/vardeFM"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
optdepends=('hamlib: Hamlib rigctld PTT support')
provides=('vardefm')
conflicts=('vardefm')
source=("git+https://github.com/notepid/vardeFM.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked -p vardefm-cli
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/vardefm" "$pkgdir/usr/bin/vardefm"
  install -Dm644 packaging/linux/99-vardefm-cm108.rules "$pkgdir/usr/lib/udev/rules.d/99-vardefm-cm108.rules"
  install -Dm644 packaging/systemd/vardefm.service "$pkgdir/usr/lib/systemd/system/vardefm.service"
  install -Dm644 packaging/vardefm.1 "$pkgdir/usr/share/man/man1/vardefm.1"
  install -Dm644 packaging/README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 docs/RADIO.md "$pkgdir/usr/share/doc/$_pkgname/RADIO.md"
  install -Dm644 docs/PROTOCOL.md "$pkgdir/usr/share/doc/$_pkgname/PROTOCOL.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
