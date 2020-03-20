# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
_realname='libinputsynth'
pkgname="$_realname-git"
pkgver=0.14.0.61.315d554
pkgrel=1
pkgdesc='Synthesize desktop input for X11 and Wayland'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/libinputsynth'
depends=('glib2')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'xdotool')
license=('MIT')
options=('debug' '!strip')
 
source=('git+https://gitlab.freedesktop.org/xrdesktop/libinputsynth.git')

md5sums=('SKIP')

ver() {
  PREFIX="project('libinputsynth', 'c', version: '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd $_realname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(ver).$revision.$hash
}

build() {
  cd $_realname
  rm -rf build
  meson build --prefix=/usr/ --libdir=lib
  ninja -C build
}

package() {
  cd $_realname
  DESTDIR="$pkgdir" ninja -C build install
}
