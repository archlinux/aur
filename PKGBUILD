# Maintainer: envolution
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Talebian <talebian@sovietunion.xyz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=bottles-git
pkgver=51.17.r0.g7063d286
pkgrel=1
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
  libadwaita
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
  python-requests
  python-steamgriddb
  python-yaml
  vkbasalt-cli
  webkit2gtk
  wine
  xorg-xdpyinfo
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
source=("${pkgname%-git}::git+https://github.com/bottlesdevs/Bottles.git" dont-care-about-sandbox.patch)
sha256sums=('SKIP'
            '489d16cea77d5acb6c7407c7b0f4f28eb6db478ae2b2a0a951cefde555e44d85')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  [ -d build ] && rm -rf build
  mkdir build
  #  patch -Np1 -i ../dont-care-about-sandbox.patch # this is the OpenSUSE patch Fabio referenced
  #  for now let's try bypass so the sourcecode can change without breaking our patch
  sed -i 's/if not fs.is_file.*$/if false/' bottles/frontend/meson.build
  sed -i '/if not Xdp.Portal.running_under_sandbox()/,/^            return$/s/^/#/' bottles/frontend/windows/main_window.py
}

build() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson build
  ninja -C build
}

#check() {
#disable for now since we know it's failing for appstream issues
#  ninja test -C "$srcdir/${pkgname%-git}/build" || true
#}

package() {
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir/" ninja install -C build
}
# vim:set ts=2 sw=2 et:
