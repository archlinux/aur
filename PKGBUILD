# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.0.0.r526.gd9989cd
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub. (git version)"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
license=('GPL-3.0-only')
depends=(
  'gtk4'
  'libadwaita'
  'flatpak'
  'appstream'
  'libxmlb'
  'glycin'
  'libyaml'
  'libsoup3'
  'json-glib'
  'glib2'
  'pango'
  'graphene'
  'dconf'
  'cairo'
  'libdex'
)
makedepends=('meson' 'ninja' 'glib2-devel' 'blueprint-compiler' 'git')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "bazaar::git+https://github.com/kolunmi/bazaar.git"
  "libdex::git+https://gitlab.gnome.org/GNOME/libdex.git#tag=0.11.1"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd bazaar
  printf "0.0.0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  # build bundled libdex
  meson setup --prefix="/usr/lib/${_pkgname}" --libdir=lib --buildtype=release \
    libdex libdex-build
  ninja -C libdex-build

  # configure bazaar to build against bundled libdex
  export PKG_CONFIG_PATH="$srcdir/libdex-build/meson-uninstalled"
  export LD_LIBRARY_PATH="$srcdir/libdex-build"

  # preserve default LDFLAGS and add rpath
  export LDFLAGS="$LDFLAGS -Wl,-rpath,\$ORIGIN/../lib/bazaar/lib"

  meson setup --prefix=/usr --buildtype=release \
    bazaar bazaar-build
  ninja -C bazaar-build
}

package() {
  # install bundled libdex to private dir
  DESTDIR="$pkgdir" meson install -C "$srcdir/libdex-build"
  # install bazaar
  DESTDIR="$pkgdir" meson install -C "$srcdir/bazaar-build"
}
