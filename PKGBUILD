# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
 
basename='xrdesktop'
pkgname="$basename-git"
pkgver=0.13.2.584.20132fa
pkgrel=1
pkgdesc='A library for XR interaction with classical desktop compositors.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/xrdesktop'
depends=('glib2' 'gxr-git' 'gulkan-git')
provides=("$basename="$pkgver)
conflicts=("$basename")
makedepends=('meson' 'git' 'glslang' 'gtk-doc' 'vulkan-headers')
license=('MIT')
options=('debug' '!strip')
 
source=('git+https://gitlab.freedesktop.org/xrdesktop/xrdesktop.git')

md5sums=('SKIP')

ver() {
  PREFIX="project('xrdesktop', 'c', version: '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(ver).$revision.$hash
}

build() {
  cd $basename
  rm -rf build
  meson build --prefix=/usr/ --libdir=lib
  ninja -C build
}

check() {
  cd $basename
  meson test -C build/ --no-suite xr --no-suite post-install
}

package() {
  cd $basename
  DESTDIR="$pkgdir" ninja -C build install
}
