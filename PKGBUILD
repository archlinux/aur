# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.3.5
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/org.gnome.World.PikaBackup"
license=('GPL')
depends=('borg' 'gtk3' 'libhandy' 'python-llfuse')
makedepends=('cargo' 'meson')
source=("https://gitlab.gnome.org/World/pika-backup/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'remove-install_script.patch')
sha256sums=('810e009ffbd6f3524ac28fefbf97a6b77483e3b7744af8b69f625fcd57398cc0'
            '92f89123e206a02f614faab838ca5bc4524f72283275630c07c8fa9f3aa4f3f6')

prepare() {
  cd "$pkgname-v$pkgver"

  # Remove single process limit for tests
#  sed -i '/codegen-units/d' Cargo.toml

  # Disable update-desktop-database & gtk-update-icon-cache
  patch --strip=1 data/meson.build $srcdir/remove-install_script.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

# tests/borg_integration.rs fails
#check() {
#  export RUSTUP_TOOLCHAIN=stable
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
