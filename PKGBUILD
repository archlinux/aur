# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Talebian <talebian@sovietunion.xyz>

pkgname=bottles-git
pkgver=51.10.r0.g28ab196b
pkgrel=2
epoch=2
pkgdesc="Easily manage wineprefix using environments"
arch=(any)
url="https://usebottles.com/"
license=(GPL3)
depends=(
  blueprint-compiler
  cabextract
  dconf
  fvs
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
source=("${pkgname%-git}::git+https://github.com/bottlesdevs/Bottles.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "$srcdir/${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build () {
  cd "$srcdir/${pkgname%-git}"
  arch-meson build -Ddevel=true
  ninja -C build
}

check () {
  ninja test -C "$srcdir/${pkgname%-git}/build" || true
}

package () { 
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir/" ninja install -C build
}

