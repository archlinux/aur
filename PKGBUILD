# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-extensions-sync-git
pkgver=10.r1.gf78a112
pkgrel=1
pkgdesc="Sync all extensions and their configurations across all gnome instances"
arch=('any')
url="https://github.com/oae/gnome-shell-extensions-sync"
install=${pkgname%-git}.install
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=3.36')
makedepends=('git' 'glib2' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  yarn install
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  yarn build
}

package() {
  cd "${srcdir}/${pkgname%-git}/dist"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  cp -r * "${destdir}"
  install -Dm644 "schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}
