# Maintainer: lmartinez-mirror
# Maintainer: Artem Senichev <artemsen@gmail.com>
# Contributor: Artem Senichev <artemsen@gmail.com>

_pkgname=swayimg
pkgname=${_pkgname}-git
pkgver=1.11
pkgrel=1
pkgdesc='Image viewer for Sway/Wayland'
arch=('x86_64')
license=('MIT')
makedepends=(
  'git'
  'bash-completion'
  'meson'
  'wayland-protocols'
  )
depends=(
  'wayland'
  'libxkbcommon'
  'json-c'
  'fontconfig'
  'freetype2'
  'hicolor-icon-theme'
  'libheif'
  'libjxl'
  'librsvg'
  'libwebp'
  'libtiff'
  'libexif'
  )
optdepends=('bash-completion: Bash completions')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/artemsen/swayimg'
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --always | sed 's/-g.*//;s/^v//;s/-/./'
}

build() {
  local meson_options=(
    -D heif=enabled
    -D bash=enabled
    -D exif=enabled
    -D gif=enabled
    -D jpeg=enabled
    -D jxl=enabled
    -D svg=enabled
    -D tiff=enabled
    -D webp=enabled
    -D man=true
    -D desktop=true
    -D version=${pkgver}
  )
  arch-meson ${_pkgname} build "${meson_options[@]}"
  meson compile -C build
}

package(){
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${_pkgname}/
}
