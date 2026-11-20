# Maintainer: SpeeNotPee <heckingmaster666@gmail.com>
#repo copy of the aur pkg. same name as the aur one, cuz plain `pigment` is someone elses app
pkgname=pigment-launcher
_srcname=Pigment
pkgver=0.2.2
pkgrel=1
pkgdesc="Roblox launcher and manager for Linux (drives the Sober runtime)"
#sober dropped arm in sept 2026, so x86_64 is the only arch that can actually run roblox
arch=('x86_64')
url="https://github.com/SpeeNotPee/Pigment"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'git')
optdepends=('flatpak: required to install and run the Sober runtime'
            'xdg-utils: to set Pigment as the default roblox:// handler'
            'kservice: kbuildsycoca6, refreshes KDE menus after a handler change')
#lto off is the real fix for the link failure, dont go unsetting CFLAGS again
options=('!lto')
install=pigment-launcher.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/SpeeNotPee/Pigment/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30830e6f80758c8a6b9953b444db05b5e840d7244ce5c33943f33399f0ed320a')

prepare() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$_srcname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --workspace
}

package() {
  cd "$_srcname-$pkgver"
  #CARGO=true so make install dont rerun cargo under fakeroot, build() already did it
  make install PREFIX=/usr DESTDIR="$pkgdir" CARGO=true
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
