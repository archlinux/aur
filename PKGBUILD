# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=valent-git
pkgver=r962.d65f4698
pkgrel=1
pkgdesc="Connect, control and sync devices"
arch=('x86_64')
url="https://valent.andyholmes.ca"
license=('GPL3')
depends=('evolution-data-server' 'gnutls' 'gstreamer' 'json-glib' 'libadwaita'
         'libpeas' 'libportal-gtk4' 'libpulse' 'libsysprof-capture' 'sqlite')
makedepends=('git' 'meson' 'gobject-introspection' 'vala')
checkdepends=('appstream') # walbottle: for JSON tests, requires -Dtests=true
provides=('libvalent-1.so=1.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
    --buildtype debugoptimized \
    -Dwarning_level='2' \
    -Dwerror='true' \
    -Dfirewalld='true'
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
