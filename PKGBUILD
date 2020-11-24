# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
 
_realname='xrgears'
pkgname="$_realname-git"
pkgver=1.0.1.55.d0bee35
pkgrel=1
pkgdesc='An OpenXR example using Vulkan for rendering.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/monado/demos/xrgears'
depends=('openxr' 'vulkan-icd-loader')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'glslang' 'vulkan-headers' 'openxr' 'vim' 'glm')
license=('MIT')
options=('debug' '!strip')

source=('git+https://gitlab.freedesktop.org/monado/demos/xrgears.git')
md5sums=('SKIP')

ver() {
  PREFIX="project('xrgears', \['c', 'cpp'\], version: '"
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
  meson build --prefix=/usr/
  ninja -C build
}

package() {
  cd $_realname
  DESTDIR="$pkgdir" ninja -C build install
}
