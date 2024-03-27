# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-nightthemeswitcher-git
pkgver=77.r0.g34aeb19
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=(
  'GPL3'
  'MIT'
  'GPL2'
  'LGPL'
  'CCPL:by-nc-sa'
)
depends=(
  'gnome-shell>=1:46'
)
makedepends=(
  'git'
  'eslint'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  local uuid=$(grep -Po '(?<=UUID = \x27)[^\x27]*' meson.build)
  local schema=$(grep -Po '(?<=DNS = \x27)[^\x27]*' meson.build).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$destdir/schemas/$schema" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$destdir/schemas/"

  cp -r "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale" "$pkgdir/usr/share/"
  rm -rf "$destdir/locale/"

  install -Dm644 "README.md" "CONTRIBUTING.md" "CHANGELOG.md" -t "$pkgdir/usr/share/doc/${pkgname%-git}"
    cp -r "res" "$pkgdir/usr/share/doc/${pkgname%-git}"

  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
