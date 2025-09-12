# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.4.9.r9.g88d4fe3
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
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  # build bundled libdex
  meson setup --prefix="/usr/lib/${_pkgname}" --libdir=lib --buildtype=release \
    libdex libdex-build
  ninja -C libdex-build

  # get system pkg-config path
  system_pc_path=$(pkg-config --variable pc_path pkg-config)

  # create native file
  cat > "$srcdir/native.ini" <<EOF
[properties]
pkg_config_libdir = '$srcdir/libdex-build/meson-uninstalled:$system_pc_path'
EOF

  # build bazaar using native file
  meson setup --prefix=/usr --buildtype=release --native-file="$srcdir/native.ini" \
    bazaar bazaar-build
  ninja -C bazaar-build
}

package() {
  # Install bundled libdex to private dir
  DESTDIR="$pkgdir" meson install -C "$srcdir/libdex-build"
  # Install bazaar
  DESTDIR="$pkgdir" meson install -C "$srcdir/bazaar-build"
}
