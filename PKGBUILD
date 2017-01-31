# Maintainer: Grigorii Horos <horosgrisa@gmail.com>
pkgname=feedreader-git
pkgver=1.6.2.r1672.b538ade
_pkgver=1.6.2 # Must be manually bumped when a new stable version is released (see pkgver())
pkgrel=2
pkgdesc="FeedReader is a modern desktop application designed to complement existing web-based RSS accounts."
arch=('i686' 'x86_64')
url="https://github.com/jangernert/FeedReader"
license=('GPL3')
groups=()
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'libpeas' 'gnome-online-accounts' 'curl')
makedepends=('git' 'vala' 'gobject-introspection' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/jangernert/FeedReader.git')
sha256sums=('SKIP')

# Upstream tags point releases in a "stable" branch, so these are not reachable from master.
# Therefore, we use the "no tags" version, but manually prepended by the latest stable.
pkgver() {
  cd "$srcdir/FeedReader"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  mkdir -p "$srcdir/FeedReader/build"
  cd "$srcdir/FeedReader/build"
  cmake \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DGSETTINGS_COMPILE=OFF \
	  -DCMAKE_INSTALL_LIBDIR=/usr/lib \
	  ..
  make
}

package() {
  cd "$srcdir/FeedReader/build"
  make DESTDIR="${pkgdir}" install
}
