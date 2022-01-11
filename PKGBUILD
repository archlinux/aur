# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

pkgname=baobab-git
pkgver=42.alpha.r1.g30f0653
pkgrel=1
pkgdesc="A graphical directory tree analyzer"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://wiki.gnome.org/Apps/DiskUsageAnalyzer"
license=(GPL2)
groups=(gnome)
depends=(dconf gtk4 libadwaita gsettings-desktop-schemas librsvg)
makedepends=(intltool itstool vala gobject-introspection yelp-tools appstream-glib git meson)
provides=(baobab)
conflicts=(baobab)
source=("${pkgname%-git}::git+https://gitlab.gnome.org/GNOME/baobab.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson baobab build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # https://bugs.archlinux.org/task/31861
  sed -i '/MimeType/d' "$pkgdir/usr/share/applications/org.gnome.baobab.desktop"
}
