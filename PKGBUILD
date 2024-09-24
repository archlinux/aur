# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pika-backup
pkgver=0.7.4
pkgrel=1
epoch=1
pkgdesc="Keep your data safe"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/PikaBackup"
license=('GPL-3.0-or-later')
depends=(
  'borg'
  'fuse3'
  'libadwaita'
  'libsecret'
  'python-pyfuse3'
)
makedepends=(
  'cargo'
  'git'
  'itstool'
  'meson'
)
#checkdepends=(
#  'openssh'
#  'xorg-server-xvfb'
#)
optdepends=(
  'gvfs: Network shares'
)
source=("git+https://gitlab.gnome.org/World/pika-backup.git#tag=v$pkgver")
sha256sums=('4d4c0965c6e7b11d78a550e253c07eb21d63d7108f723005430482f5aef6514f')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$pkgname"
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
