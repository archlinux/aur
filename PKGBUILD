# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

_realname='gulkan'
pkgname="$_realname-git"
pkgver=0.16.0.r445.55721c9
pkgrel=1
pkgdesc='A GLib library for Vulkan abstraction.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/gulkan'
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'vulkan-icd-loader' 'graphene' 'cairo' 'shaderc' 'json-glib' 'libxkbcommon' 'wayland' 'libxcb' 'xcb-util-keysyms')
# Dependencies only used for examples: 'libdrm' 'wayland-protocols' 'glfw')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'vulkan-headers' 'gtk-doc')
license=('MIT')

source=('git+https://gitlab.freedesktop.org/xrdesktop/gulkan.git#branch=main')
md5sums=('SKIP')

ver() {
  PREFIX="        version: '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd "$_realname"
  printf "$(ver).r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  rm -rf build
  arch-meson "$_realname" build --libdir=lib --buildtype release -Dapi_doc=true
  ninja -C build
}

#check() {
#  meson test -C build/
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/gulkan/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
