# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in for each release, by .github/workflows/aur.yml and
# by the Arch Linux job of .github/workflows/release.yml.
pkgname=leyen
pkgver=0.10.0
pkgrel=1
pkgdesc='Keep a library of Windows games and run them with Proton through umu-launcher'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/leyen'
license=('GPL-3.0-or-later')
depends=('gtk4>=1:4.22' 'libadwaita>=1:1.9' 'glib2' 'hicolor-icon-theme' 'libgcc' 'glibc' 'bubblewrap' 'dbus' 'systemd' 'curl' 'tar')
makedepends=('cargo' 'blueprint-compiler' 'just' 'gettext')
optdepends=('winetricks: use the installed winetricks instead of downloading it'
            'mangohud: MangoHud switch')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('33e7a08ad597bf3950e3c321cd334350bb2cc95fd3d37eb69e4cf80a78b9485d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  # just writes shebang recipes to XDG_RUNTIME_DIR, which a clean chroot does not have.
  DESTDIR="$pkgdir" JUST_TEMPDIR="$srcdir" just prefix=/usr install
}
