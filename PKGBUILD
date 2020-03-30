# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# AUR: Nikita Tarasov <nikatar@disroot.org>

pkgname=libnma-indicator
pkgver=1.8.28
pkgrel=2
pkgdesc="NetworkManager GUI client library with AppIndicator/StatusNotifierItem"
url="https://wiki.gnome.org/Projects/NetworkManager/"
arch=(x86_64)
license=(GPL LGPL)
depends=(libnm gcr gtk3 iso-codes mobile-broadband-provider-info libappindicator-gtk3)
makedepends=(gobject-introspection git gtk-doc meson vala)
provides=(libnma.so libnma)
conflicts=(libnma.so libnma)
_commit=0c40a6aeaabbf2673e48360dc00419793da084b8  # tags/1.8.28^0
source=("git+https://gitlab.gnome.org/GNOME/libnma.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-indicator}
  git describe --tags | sed 's/-dev/dev/;s/-/+/g'
}

prepare() {
  cd ${pkgbase%-indicator}
}

build() {
  arch-meson ${pkgbase%-indicator} build -Dappindicator=yes
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
