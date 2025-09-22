# Maintainer: dragoneki <dragoneki at proton dot me>
pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.4.11.r24.gf9c8d49
pkgrel=1
pkgdesc="A new app store for GNOME with focus on flatpaks, particularly Flathub. (git version)"
arch=('x86_64')
url="https://github.com/kolunmi/bazaar"
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
  'json-glib'
  'libadwaita'
  'libdex'
  'libsoup3'
  'libxmlb'
  'libyaml'
  'pango'
)
makedepends=('blueprint-compiler' 'git' 'glib2-devel' 'meson' 'ninja')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "bazaar::git+https://github.com/kolunmi/bazaar.git"
  "glycin-2.0-compat.patch::https://github.com/kolunmi/bazaar/commit/b9c07d28e87d243ba99d6fa7365dc6ad8abccb73.patch"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd bazaar
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd bazaar
  patch -p1 -i ../glycin-2.0-compat.patch
}

build() {
  cd bazaar
  meson setup --prefix=/usr --buildtype=release build
  ninja -C build
}

package() {
  cd bazaar
  DESTDIR="$pkgdir" meson install -C build
}
