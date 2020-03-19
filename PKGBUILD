# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
 
basename='xrdesktop'
pkgname="$basename-git"
pkgver=0.13.99.778.60dd923
pkgrel=1
pkgdesc='A library for XR interaction with classical desktop compositors.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/xrdesktop'
depends=('gxr-git')
provides=("$basename="$pkgver)
conflicts=("$basename")
makedepends=('meson' 'git' 'glslang' 'gtk-doc' 'vulkan-headers')
license=('MIT')
 
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
  rm -rf build
  arch-meson $basename build --libdir=lib --buildtype release -Dapi_doc=true
  ninja -C build
}

check() {
  meson test -C build/ --no-suite xr --no-suite post-install
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/xrdesktop/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
