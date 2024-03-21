# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pika-backup
pkgver=0.7.1
pkgrel=1
epoch=1
pkgdesc="Keep your data safe"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/PikaBackup"
license=('GPL-3.0-or-later')
depends=('borg' 'fuse3' 'libadwaita' 'libsecret' 'python-pyfuse3')
makedepends=('cargo' 'git' 'itstool' 'meson')
checkdepends=('appstream')
#checkdepends+=('openssh' 'xorg-server-xvfb')
_commit=f9d416385bb0d1949956c07e0117cba3a9c525dc  # tags/v0.7.1^0
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
#  export CARGO_HOME="$srcdir/cargo-home"
#  export RUSTUP_TOOLCHAIN=stable
#  export LANG=C.UTF-8
#  export NO_AT_BRIDGE=1
#  xvfb-run -a -s "-screen 0 1024x768x24" dbus-run-session meson test -C build --no-stdsplit --print-errorlogs || :

  desktop-file-validate build/data/org.gnome.World.PikaBackup.Monitor.desktop
  appstreamcli validate --no-net build/data/org.gnome.World.PikaBackup.metainfo.xml || :
}

package() {
  cd "$pkgname"
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
