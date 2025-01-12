# Maintainer: Guillaume Benoit <guillaume@manjaro.org>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Helmut Stult
# Contributor: Leandro Cunha <leandrocunha016@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac

pkgname=pamac-gtk3
pkgver=10.6.0
pkgrel=5
pkgdesc="A Package Manager based on libalpm with AUR and Appstream support (GTK3)"
arch=('x86_64' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL-3.0-or-later')
depends=(
  'archlinux-appstream-data'
  'gtk3'
  'libhandy'
  'libnotify'
  'libpamac-aur>=11.6.4'
  'pamac-cli>=11.6.0'
)
makedepends=(
  'asciidoc'
  'git'
  'gobject-introspection'
  'meson'
  'vala'
)
optdepends=(
  'libpamac-flatpak-plugin: for Flatpak support'
# 'libpamac-snap-plugin: for Snap support'
#  'libpamac-aur-plugin: for AUR support'
#  'libpamac-appstream-plugin: for Appstream support'
)
provides=('pamac' 'pamac-gtk')
conflicts=('pamac-gtk')
options=('debug')
_commit=9dca256b8cc581a262be09355662829742127efe  # tags/v10.6.0^0
source=("git+https://gitlab.manjaro.org/applications/pamac.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pamac
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd pamac
  local src
  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      patch -Np1 < "../$src"
  done
}

build() {
  arch-meson pamac build \
    -Denable-fake-gnome-software=false
  meson compile -C build
}

check() {
  cd pamac
  desktop-file-validate data/applications/*.desktop || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # remove GNOME Shell extension
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/"
}
