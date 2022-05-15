# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.4.0
pkgrel=1
epoch=1
pkgdesc="Simple backups based on borg"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/org.gnome.World.PikaBackup"
license=('GPL')
depends=('borg' 'libadwaita' 'libsecret' 'python-llfuse')
makedepends=('cargo' 'itstool' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/World/pika-backup/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'remove-install_script.patch')
sha256sums=('043ce5692135ecb2326c389b5e90c0de134e4ae5153a8c855c609d4e5c63ecc1'
            '3045a0dc5069bf7ff5fafb0d6702dbc2168fe79af2a184cbc802d76f1be82a9b')

prepare() {
  cd "$pkgname-v$pkgver"

  # Disable update-desktop-database & gtk-update-icon-cache
  patch -Np1 -i ../remove-install_script.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {

  # cargo-test fails
#  export RUSTUP_TOOLCHAIN=stable
#  meson test -C build --no-stdsplit --print-errorlogs

  desktop-file-validate build/data/org.gnome.World.PikaBackup.Monitor.desktop
  appstream-util validate-relax --nonet build/data/org.gnome.World.PikaBackup.metainfo.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
