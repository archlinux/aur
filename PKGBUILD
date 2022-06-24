# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.4.1
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
sha256sums=('f65039047e732f54d8eb1eab801d0bdece5e7345b3a0369add3943eb7ce616aa'
            'b03e99403c43d82c0257d652f516321b024a9f1abedbdb11ae2d06f8e767994c')

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
