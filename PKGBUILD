# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

_realname='g3k'
pkgname="$_realname-git"
pkgver=0.16.0.1331.50cabc0
pkgrel=1
pkgdesc='A 3DUI widget toolkit.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/g3k'
depends=('gxr-git')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'glslang' 'gtk-doc' 'vulkan-headers')
license=('MIT')
# options=('debug' '!strip')

source=('git+https://gitlab.freedesktop.org/xrdesktop/g3k.git')
md5sums=('SKIP')

ver() {
  PREFIX="project('g3k', 'c', version: '"
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
  arch-meson $_realname build --libdir=lib --buildtype release #-Dapi_doc=true
  ninja -C build
}

check() {
  meson test -C build/ --no-suite post-install --no-suite xr
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/g3k/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
