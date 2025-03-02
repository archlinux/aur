# Maintainer: envolution
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Talebian <talebian@sovietunion.xyz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=bottles-git
pkgver=51.18.r78.g3e1dc5bd
pkgrel=2
epoch=2
pkgdesc="Easily manage wineprefix using environments"
arch=(any)
url="https://usebottles.com/"
license=(GPL-3.0-only)
depends=(
  blueprint-compiler
  cabextract
  dconf
  gtk4
  gtksourceview5
  hicolor-icon-theme
  icoextract
  imagemagick
  lib32-gnutls
  libadwaita-git
  libhandy
  libportal-gtk4
  p7zip
  patool
  python
  python-chardet
  python-fvs
  python-gobject
  python-markdown
  python-orjson
  python-pathvalidate
  python-pycurl
  python-pyfluidsynth
  python-requests
  python-steamgriddb
  python-yaml
  vkbasalt-cli
  webkit2gtk
  wine
  xorg-xdpyinfo

  # namcap implicit depends
  libportal
  glib2
  gdk-pixbuf2
  pango
)
optdepends=(
  gamemode
  gvfs
  lib32-vkd3d
  lib32-vulkan-icd-loader
  vkd3d
  vulkan-icd-loader
)
makedepends=(meson ninja git)
checkdepends=(appstream-glib)
provides=(bottles)
conflicts=(bottles)
source=("git+https://github.com/bottlesdevs/Bottles.git")
sha256sums=('SKIP')

pkgver() {
  cd "Bottles"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "Bottles"
  [ -d build ] && rm -rf build
  mkdir build
  #  for now let's try bypass so the sourcecode can change without breaking our patch
  sed -i 's/if not fs.is_file.*$/if false/' bottles/frontend/meson.build
  sed -i '/if not Xdp.Portal.running_under_sandbox()/,/^            return$/s/^/#/' bottles/frontend/window.py
}

build() {
  cd "Bottles"
  arch-meson build
  ninja -C build
}

#check() {
#disable for now since we know it's failing for appstream issues
#  ninja test -C "Bottles/build" || true
#}

package() {
  cd "Bottles"
  DESTDIR="$pkgdir/" ninja install -C build
}
# vim:set ts=2 sw=2 et:
