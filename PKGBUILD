# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
 
_realname='gxr'
pkgname="$_realname-git"
pkgver=0.13.2.661.b24d5f6
pkgrel=1
pkgdesc='A glib wrapper for the OpenVR and soon the OpenXR API.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/gxr'
depends=('glib2' 'gtk3' 'gulkan-git' 'openvr-git')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'vulkan-headers')
license=('MIT')
options=('debug' '!strip')
 
source=('git+https://gitlab.freedesktop.org/xrdesktop/gxr.git')

md5sums=('SKIP')

ver() {
  PREFIX="project('gxr', 'c', version: '"
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

check() {
  cd $_realname
  meson test -C build/ --no-suite xr
}

package() {
  cd $_realname
  DESTDIR="$pkgdir" ninja -C build install
}
