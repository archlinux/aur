# Maintainer: dragoneki <dragoneki at proton dot me>

pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.9.4.r54.g58d5e1b
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub. (git version)"
arch=('x86_64')
url="https://gitlab.gnome.org/World/bazaar"
license=('GPL-3.0-only')
depends=(
  'appstream'
  'cairo'
  'dconf'
  'flatpak'
  'glib2'
  'glycin'
  'glycin-gtk4'
  'graphene'
  'gtk4'
  'gtksourceview5'
  'json-glib'
  'libadwaita'
  'libdex'
  'libheif'
  'libmalcontent'
  'libproxy'
  'libsecret'
  'libsoup3'
  'systemd-libs'
  'libxmlb'
  'libyaml'
  'md4c'
  'pango'
  'webkitgtk-6.0'
)
makedepends=('blueprint-compiler' 'git' 'glib2-devel' 'meson' 'python-babel' 'ninja' 'libxml2' 'vala')
optdepends=('krunner-bazaar: krunner integration' 'malcontent: parental controls')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://gitlab.gnome.org/World/bazaar.git"
  "libdex::git+https://gitlab.gnome.org/GNOME/libdex.git#tag=1.2.beta"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  # symlink libdex source into bazaars subprojects dir
  mkdir -p subprojects
  ln -sfT "${srcdir}/libdex" subprojects/libdex
}

build() {
  # static link libdex
  meson setup "${_pkgname}" build \
    --prefix=/usr \
    --buildtype=release \
    --force-fallback-for=libdex \
    -Dlibdex:default_library=static \
    -Dlibdex:introspection=disabled \
    -Dlibdex:vapi=false \
    -Dlibdex:tests=false \
    -Dlibdex:examples=false
  meson compile -C build
}

package() {
  # skip libdex files
  meson install -C build --destdir "${pkgdir}" --skip-subprojects=libdex
}
