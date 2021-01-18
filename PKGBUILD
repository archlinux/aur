# Maintainer: Lubosz Sarnecki <lubosz at gmail com>
 
_realname='sphvr'
pkgname="$_realname-git"
pkgver=0.0.1.63.3a9ec15
pkgrel=1
pkgdesc='A spherical media player using Vulkan and GStreamer.'
arch=('i686' 'x86_64')
url='https://gitlab.com/lubosz/sphvr'
depends=('gulkan-git' 'gst-plugins-bad-libs')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'glslang' 'vulkan-headers' 'glm')
license=('MIT')

source=('git+https://gitlab.com/lubosz/sphvr.git')
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

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/sphvr/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
