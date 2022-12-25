# Maintainer: Funami
# Contributor: aksr <aksr at t-com dot me>
pkgname=fontview-git
pkgver=r219.23a4679
pkgrel=1
pkgdesc="A simple font viewer"
arch=('i686' 'x86_64')
url="https://github.com/khaledhosny/fontview"
license=('GPLv2')
depends=('gtk3' 'cairo' 'freetype2' 'pango' 'fribidi' 'fontconfig' 'glib2')
makedepends=('git' 'meson')
source=("git+https://github.com/khaledhosny/fontview.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/fontview"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/fontview"
  sed -i '/i18n\.merge_file(/{n;d}' meson.build # fix "ERROR: Function does not take positional arguments."
  arch-meson --buildtype=release build
}

build() {
  cd "${srcdir}/fontview"
  meson compile -C build
}

package() {
  cd "${srcdir}/fontview"
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
