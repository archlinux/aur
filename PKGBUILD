# Maintainer: LuoYi <langisme_dot_qq_com>
# Contributor: igor-dyatlov <dyatlov.igor@gmail.com>

pkgname=blackbox-terminal-git
pkgver=0.12.0.r0.gc9ed9fd
pkgrel=1
pkgdesc="A beautiful GTK 4 terminal."
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/blackbox"
license=('GPL3')
depends=('glib2' 'libadwaita-git' 'libmarble-git' 'vte4-git' 'json-glib' 'pcre')
makedepends=('git' 'meson' 'vala' 'gi-docgen')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(blackbox::git+$url.git launch_fix.diff rename_icons.diff)
b2sums=('SKIP'
        '1417439dde6b35fa189604d6fe6083e55ac7ea0aa2b0f3373e99c2a864e6cd25be99e1fbe78d4dd633e47d0270585778ccf5817154c2b9a0fdd32827af5478ee'
        '22e4a1f53a1a9411104bcea87dd51c86479351d0ee98b4dc4a0b4a92276a4f3f2945c12e3e7aa6a5137ebcb7a67c959eca11f4a3babb3cbed0c0231e11afaecc')

pkgver() {
  cd blackbox
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd blackbox

  # Rename icons
  # Avoid install failed when extension-manager is installed
  patch -p1 < ../rename_icons.diff

  # Fix launch issue of blackbox & cresh when open context menu
  # see: https://github.com/mitchmindtree/blackbox.nix/issues/2
  patch -p1 < ../launch_fix.diff
}

build() {
  arch-meson blackbox build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
