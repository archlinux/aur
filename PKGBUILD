# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pika-backup
pkgver=0.6.1
pkgrel=1
epoch=1
pkgdesc="Keep your data safe"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/app/org.gnome.World.PikaBackup"
license=('GPL3')
depends=('borg' 'fuse3' 'libadwaita' 'libsecret')
makedepends=('cargo' 'git' 'itstool' 'meson')
checkdepends=('appstream-glib')
#checkdepends+=('xorg-server-xvfb')
_commit=932e918d4d068f4e88e4c36b0fe449a92b4bdfd7  # tags/v0.6.1^0
source=("git+https://gitlab.gnome.org/World/pika-backup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Remove single process limit since we're not running the tests
  sed -i '/codegen-units/d' Cargo.toml
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$srcdir/$pkgname"

  # test failed_ssh_connection
#  export RUSTUP_TOOLCHAIN=stable
#  export LANG=C.UTF-8
#  export NO_AT_BRIDGE=1
#  xvfb-run -a -s "-screen 0 1024x768x24" dbus-run-session meson test -C build --no-stdsplit --print-errorlogs || :

  desktop-file-validate build/data/org.gnome.World.PikaBackup.Monitor.desktop
  appstream-util validate-relax --nonet build/data/org.gnome.World.PikaBackup.metainfo.xml
}

package() {
  cd "$srcdir/$pkgname"
  meson install -C build --destdir "$pkgdir"
}
