# Maintainer: LuoYi <langisme_dot_qq_com>
# Contributor: igor-dyatlov <dyatlov.igor@gmail.com>

pkgname=blackbox-terminal-git
pkgver=42.alpha3.r27.ge0f2fbf
pkgrel=1
pkgdesc="A beautiful GTK 4 terminal."
arch=('x86_64')
url="https://gitlab.gnome.org/raggesilver/blackbox"
license=('GPL3')
depends=('glib2' 'libadwaita' 'libmarble-git' 'vte4-git' 'json-glib' 'pcre')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(blackbox::git+$url.git launch_fix.diff)
b2sums=('SKIP'
        'dcb2b68305fef327a5d718840f9b934cddb45ef2f2967f845734253eaca11d47c0b1016d2b8332fc05f162392f6021b4f5937758e9343bf81569de15d14b8315')

pkgver() {
  cd blackbox
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd blackbox

  # Fix launch issue of blackbox
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
