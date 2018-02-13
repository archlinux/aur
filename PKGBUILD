# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=scratch-text-editor-git
pkgver=r2826.e3686e34
pkgrel=1
pkgdesc='The Pantheon Text Editor'
arch=('x86_64')
url='https://github.com/elementary/scratch'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'glib2' 'glibc' 'gtk3' 'gtksourceview3' 'libgee' 'libpeas'
         'libsoup' 'pango' 'zeitgeist'
         'libgranite.so')
makedepends=('appstream' 'git' 'gobject-introspection' 'granite-git'
             'gtkspell3' 'intltool' 'meson' 'vala' 'vte3' 'webkit2gtk')
optdepends=('gtkspell3: Spell Check extension'
            'vala: Outline extension'
            'vte3: Terminal extension'
            'webkit2gtk: Browser Preview extension')
provides=('scratch-text-editor')
conflicts=('scratch-text-editor')
source=('scratch-text-editor::git+https://github.com/elementary/scratch.git')
sha256sums=('SKIP')

pkgver() {
  cd scratch-text-editor

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  sed 's/libvala-0.36/libvala-0.38/' -i scratch-text-editor/plugins/outline/meson.build
}

build() {
  cd build

  arch-meson ../scratch-text-editor
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
