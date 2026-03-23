# Maintainer: dragoneki <dragoneki at proton dot me>

pkgname=bazaar-git
_pkgname=bazaar
pkgver=0.7.12.r69.gc7ebdb5
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
makedepends=('blueprint-compiler' 'git' 'glib2-devel' 'meson' 'python-babel' 'ninja')
optdepends=('krunner-bazaar: krunner integration')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "bazaar::git+https://github.com/kolunmi/bazaar.git"
  "blueprint-compiler::git+https://gitlab.gnome.org/GNOME/blueprint-compiler.git#tag=v0.20.2"
)
sha256sums=('SKIP'
            'eadb585547af0decf2c7c1d0299cdc3cccf01209c297af4d26449213451c395b')

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
