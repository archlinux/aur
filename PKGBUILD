# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pika-backup
pkgver=0.7.2
pkgrel=2
epoch=1
pkgdesc="Keep your data safe"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/PikaBackup"
license=('GPL-3.0-or-later')
depends=('borg' 'fuse3' 'libadwaita' 'libsecret' 'python-pyfuse3')
makedepends=('cargo' 'git' 'itstool' 'meson')
#checkdepends+=('openssh' 'xorg-server-xvfb')
optdepends=('gvfs: Network shares')
source=("git+https://gitlab.gnome.org/World/pika-backup.git#tag=v$pkgver")
sha256sums=('3c5a2d337c47a4141c8e2f74c43818715cff047df4197470634add094b64cbc9')

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
