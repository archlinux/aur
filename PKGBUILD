# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

_realname='xrgears'
pkgname="$_realname-git"
pkgver=1.0.1.105.caa21e1
pkgrel=1
pkgdesc='An OpenXR example using Vulkan for rendering.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/monado/demos/xrgears'
depends=('openxr'
         'vulkan-icd-loader'
         'glib2'
         'gcc-libs'
         'glibc')
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
  rm -rf build
  arch-meson "$_realname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
