# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
 
_realname='gulkan'
pkgname="$_realname-git"
pkgver=0.13.2.137.80ab70f
pkgrel=1
pkgdesc='A GLib library for Vulkan abstraction.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/gulkan'
depends=('glib2' 'gdk-pixbuf2' 'vulkan-icd-loader' 'graphene' 'cairo')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'glslang' 'vulkan-headers' 'gtk-doc')
license=('MIT')
options=('debug' '!strip')

source=('git+https://gitlab.freedesktop.org/xrdesktop/gulkan.git')
md5sums=('SKIP')

ver() {
  PREFIX="project('gulkan', 'c', version: '"
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

#check() {
#  cd $_realname
#  ninja -C build test
#}

package() {
  cd $_realname
  DESTDIR="$pkgdir" ninja -C build install
}
