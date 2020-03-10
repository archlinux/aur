pkgname=gnome-user-share-git
_pkgname=gnome-user-share
pkgver=3.34.0+8+g94ff55d
pkgrel=1
pkgdesc="Easy to use user-level file sharing for GNOME"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/gnome-user-share"
license=(GPL)
depends=('mod_dnssd' 'dconf' 'gtk3' 'libnotify' 'libcanberra')
makedepends=('libnautilus-extension' 'git' 'meson' 'yelp-tools')
provides=('gnome-user-share')
conflicts=('gnome-user-share')
source=("git+https://gitlab.gnome.org/GNOME/gnome-user-share.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_USER_SHARE_//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build \
    -D httpd=/usr/bin/httpd \
    -D modules_path=/usr/lib/httpd/modules \
    -D nautilus_extension=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
