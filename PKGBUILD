# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=feedreader-git
pkgver=2.6.1.r2790
pkgrel=1
pkgdesc="FeedReader is a modern desktop application designed to complement existing web-based RSS accounts."
arch=('i686' 'x86_64')
url="https://github.com/jangernert/FeedReader"
license=('GPL3')
groups=()
depends=('sqlite3' 'gtk3' 'webkit2gtk' 'libnotify' 'libsoup' 'libgee' 'json-glib' 'libsecret' 'libpeas' 'gnome-online-accounts' 'curl' 'gumbo-parser' 'gnome-keyring')
makedepends=('git' 'vala' 'gobject-introspection' 'meson')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/jangernert/FeedReader.git')
sha256sums=('SKIP')

# Upstream tags point releases in a "stable" branch, so these are not reachable from master.
# Therefore, we use the "no tags" version, but manually prepended by the latest stable.
pkgver() {
  cd "$srcdir/FeedReader"
  printf "%s.r%s" $(git tag | tail -n1 | sed 's/^v//') "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$srcdir/FeedReader"
  git submodule init; git submodule update
}

build() {
  mkdir -p "$srcdir/FeedReader/build"
  cd "$srcdir/FeedReader/build"
  arch-meson
  ninja
}

package() {
  cd "$srcdir/FeedReader/build"
  DESTDIR="${pkgdir}" ninja install
}
