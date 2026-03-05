# Maintainer: dragoneki <dragoneki at proton dot me>

pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.7.10.r94.g01873ab
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
  'libmalcontent'
  'libsecret'
  'libsoup3'
  'libxmlb'
  'libyaml'
  'md4c'
  'pango'
  'webkitgtk-6.0'
)
makedepends=('blueprint-compiler' 'git' 'glib2-devel' 'meson' 'ninja')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "bazaar::git+https://github.com/kolunmi/bazaar.git"
  "blueprint-compiler::git+https://gitlab.gnome.org/GNOME/blueprint-compiler.git#tag=v0.20.0"
)
sha256sums=('SKIP'
            'a99a90cf5d39a97a0770038ecbd4edede2643a6ff116c6dd9308ae3e70573631')

pkgver() {
  cd bazaar
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
  cd bazaar
  mkdir -p subprojects

  # use bp compiler from source
  ln -sf "$srcdir/blueprint-compiler" subprojects/blueprint-compiler
}

build() {
  # avoid subproject download
  meson setup --prefix=/usr --buildtype=release --wrap-mode=nodownload bazaar bazaar-build
  ninja -C bazaar-build
}

package() {
  # skip subprojects
  DESTDIR="$pkgdir" meson install -C bazaar-build --skip-subprojects
}
