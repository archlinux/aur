# Maintainer: Huang-Huang Bao <eh5@sokka.cn>

_pkgbase=media-session
pkgbase=media-session-git
pkgname=(media-session-git)
pkgver=r7643.c374e0ea9
pkgrel=1
pkgdesc="Example session manager for PipeWire"
url="https://gitlab.freedesktop.org/pipewire/media-session"
license=(MIT)
arch=(x86_64)
makedepends=(git meson alsa-lib dbus pipewire systemd)
source=("git+https://gitlab.freedesktop.org/pipewire/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # make AUR helper happy
  rm -rf builddir || true
  arch-meson $_pkgbase builddir
  meson compile -C builddir
}

package_media-session-git() {
  depends=(libpipewire-0.3.so libasound.so libdbus-1.so libsystemd.so)
  provides=(pipewire-media-session)
  conflicts=(pipewire-media-session)
  install=media-session.install

  meson install -C builddir --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $_pkgbase/COPYING
}
