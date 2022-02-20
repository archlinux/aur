# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libpipewire02
pkgver=0.2.7
pkgrel=2
pkgdesc="Low-latency audio/video router and processor - legacy client library"
url="https://pipewire.org"
license=(LGPL)
arch=(x86_64)
depends=(alsa-lib dbus systemd libasound.so libdbus-1.so libudev.so)
makedepends=(git meson)
provides=(libpipewire-0.2.so)
_commit=14c11c0fe4d366bad4cfecdee97b6652ff9ed63d  # tags/0.2.7
source=("git+https://gitlab.freedesktop.org/pipewire/pipewire.git#commit=$_commit")
sha256sums=('SKIP')


pkgver() {
  cd pipewire
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pipewire
}

build() {
  arch-meson pipewire build -D gstreamer=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "$pkgdir"/{etc,usr/bin,usr/lib/systemd}
}
