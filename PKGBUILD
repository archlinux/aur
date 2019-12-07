# Maintainer: Hanspeter Portner <dev at open-music-kontrollers dot ch>
_pkgname=synthpod
pkgname="${_pkgname}-git"
pkgver=0.1.6139
pkgrel=1
pkgdesc="Lightweight non-linear plugin host"
arch=('i686' 'x86_64')
url="http://open-music-kontrollers.ch/lv2/synthpod/"
license=('Artistic2.0')
groups=('lv2-plugins' 'lv2-hosts')
depends=('lilv' 'jack' 'libgl' 'zita-alsa-pcmi' 'xcb-util-wm')
makedepends=('git' 'meson' 'ninja' 'lv2')
optdepends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'cairo')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
source=("$_pkgname::git+https://git.open-music-kontrollers.ch/lv2/synthpod")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  cat VERSION
}

build() {
  cd "$srcdir/$_pkgname"

  rm -rf build

  #
  # BUILD HERE
  #
  meson build \
    --prefix='/usr' \
    --libdir='lib'

  cd build
  meson configure -D b_lto=true
  meson configure -D use-alsa=true
  meson configure -D use-dummy=true
  meson configure -D use-jack=true
  meson configure -D use-x11=true
  #meson configure -D use-gtk2=true
  #meson configure -D use-gtk3=true
  #meson configure -D use-qt4=true
  #meson configure -D use-qt5=true
  ninja
}

package() {
  cd "$srcdir/$_pkgname/build"

  DESTDIR="$pkgdir/" ninja install
}

# vim:set ts=2 sw=2 et:
