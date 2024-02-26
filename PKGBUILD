# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

basename='xrdesktop'
pkgname="$basename-git"
pkgver=0.16.0.r1348.f507535
pkgrel=1
pkgdesc='A library for XR interaction with classical desktop compositors.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/xrdesktop'
depends=('g3k-git' 'python3' 'python-gobject' 'gobject-introspection-runtime' 'glibc' 'graphene' 'glib2' 'gxr-git' 'gcc-libs' 'gulkan-git' 'dconf' 'hicolor-icon-theme' 'gtk3')
provides=("$basename="$pkgver)
conflicts=("$basename")
makedepends=('meson' 'git' 'glslang' 'gtk-doc' 'vulkan-headers' 'pygobject-devel')
license=('MIT')

source=('git+https://gitlab.freedesktop.org/xrdesktop/xrdesktop.git#branch=main')

md5sums=('SKIP')

ver() {
  PREFIX="project('xrdesktop', 'c', version: '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd "$basename"
  printf "$(ver).r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  rm -rf build
  arch-meson "$basename" build --libdir=lib --buildtype release -Dapi_doc=true
  ninja -C build
}

check() {
  meson test -C build/ --no-suite xr --no-suite post-install
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/xrdesktop/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
