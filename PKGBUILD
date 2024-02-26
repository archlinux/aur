# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>

_realname='gxr'
pkgname="$_realname-git"
pkgver=0.16.0.r1163.426226e
pkgrel=1
pkgdesc='A glib wrapper for the OpenVR and OpenXR APIs.'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/gxr'
depends=('glib2' 'glibc' 'graphene' 'gtk3' 'gulkan-git' 'json-glib' 'openxr' 'vulkan-icd-loader')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git' 'vulkan-headers' 'gtk-doc')
license=('MIT')
source=('git+https://gitlab.freedesktop.org/xrdesktop/gxr.git#branch=main')
optdepends=('monado-git: The open source OpenXR runtime.')
md5sums=('SKIP')

ver() {
  PREFIX="project('gxr', 'c', version: '"
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
#  meson test -C build/ --no-suite xr
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/gxr/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
