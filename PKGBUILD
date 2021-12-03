# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-nightthemeswitcher-git
pkgver=37.r146.g5355bf6
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
install=${pkgname%-git}.install
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=40')
makedepends=('git' 'glib2')
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
  make build
}

package() {
  cd "${srcdir}/${pkgname%-git}/src"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  cd "${srcdir}/${pkgname%-git}/build"
  bsdtar -xf "${srcdir}/${pkgname%-git}/build/${uuid}.shell-extension.zip" \
    -C "${srcdir}/${pkgname%-git}/build"
  rm "${srcdir}/${pkgname%-git}/build/${uuid}.shell-extension.zip"
  install -dm755 "${destdir}"
  cp -r * "${destdir}"
  install -Dm644 "schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}

