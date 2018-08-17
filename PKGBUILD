# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Yosef Or Boczko <yoseforb@gnome.org>

pkgname=baobab-git
pkgver=3.29.1.r0.g3dfacf3
pkgrel=1
pkgdesc="A graphical directory tree analyzer"
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://wiki.gnome.org/Apps/DiskUsageAnalyzer"
license=(GPL2)
depends=(dconf gtk3 gsettings-desktop-schemas librsvg)
makedepends=(intltool itstool vala gobject-introspection yelp-tools appstream-glib git meson)
groups=(gnome)
provides=(baobab)
conflicts=(baobab)
source=("${pkgname}::git+https://gitlab.gnome.org/GNOME/baobab")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # https://bugs.archlinux.org/task/31861
  sed -i '/MimeType/d' "$pkgdir/usr/share/applications/org.gnome.baobab.desktop"
}
