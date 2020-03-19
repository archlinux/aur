# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
 
_realname='gulkan'
pkgname="$_realname-git"
pkgver=0.13.99.258.fd0e813
pkgrel=1
pkgdesc='A GLib library for Vulkan abstraction.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/gulkan'
depends=('gdk-pixbuf2' 'vulkan-icd-loader' 'graphene' 'cairo')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'glslang' 'vulkan-headers' 'gtk-doc')
license=('MIT')

source=('git+https://gitlab.freedesktop.org/xrdesktop/gulkan.git')
md5sums=('SKIP')

ver() {
  PREFIX="        version: '"
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
  arch-meson $_realname build --libdir=lib --buildtype release -Dapi_doc=true
  ninja -C build
}

#check() {
#  cd $_realname
#  ninja -C build test
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/gulkan/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
