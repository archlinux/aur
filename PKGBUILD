# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pika-backup
pkgver=0.6.2
pkgrel=1
epoch=1
pkgdesc="Keep your data safe"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/PikaBackup"
license=('GPL-3.0-or-later')
depends=('borg' 'fuse3' 'libadwaita' 'libsecret' 'python-pyfuse3')
makedepends=('cargo' 'git' 'itstool' 'meson')
checkdepends=('appstream-glib')
#checkdepends+=('xorg-server-xvfb')
_commit=d1847f90bbcb71bc1118a3eb3560a75598fd596c  # tags/v0.6.2^0
source=("git+https://gitlab.gnome.org/World/pika-backup.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # Remove single process limit since we're not running the tests
  sed -i '/codegen-units/d' Cargo.toml
}

build() {
  cd "$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$pkgname"

  # test failed_ssh_connection
#  export CARGO_HOME="$srcdir/cargo-home"
#  export RUSTUP_TOOLCHAIN=stable
#  export LANG=C.UTF-8
#  export NO_AT_BRIDGE=1
#  xvfb-run -a -s "-screen 0 1024x768x24" dbus-run-session meson test -C build --no-stdsplit --print-errorlogs || :

  desktop-file-validate build/data/org.gnome.World.PikaBackup.Monitor.desktop
  appstream-util validate-relax --nonet build/data/org.gnome.World.PikaBackup.metainfo.xml
}

package() {
  cd "$pkgname"
  meson install -C build --destdir "$pkgdir"
}
