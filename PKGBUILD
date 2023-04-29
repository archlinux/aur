# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=valent-git
pkgver=r1004.1cae541a
pkgrel=1
pkgdesc="Connect, control and sync devices"
arch=('x86_64')
url="https://valent.andyholmes.ca"
license=('GPL3')
depends=('evolution-data-server' 'gnutls' 'gstreamer' 'json-glib' 'libadwaita'
         'libpeas' 'libportal-gtk4' 'libpulse' 'libsysprof-capture' 'sqlite')
makedepends=('git' 'meson' 'gobject-introspection' 'vala')
#makedepends+=('gi-docgen') # -Ddocumentation=true (should be split out into a docs package)
checkdepends=('appstream')
#checkdepends+=('walbottle') # -Dtests=true (for JSON tests)
provides=('libvalent-1.so=1.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-shell-extension-valent-git')
replaces=('gnome-shell-extension-valent-git')
source=('git+https://github.com/andyholmes/valent.git'
        'git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  git config submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "${pkgname%-git}" build \
    -Ddocumentation='false' \
    -Dtests='false' \
    -Dfuzz_tests='false' \
    -Dfirewalld='true'
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
