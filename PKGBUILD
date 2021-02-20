# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extensions-gravatar-git
pkgver=7.r0.gc4a6e34
pkgrel=3
pkgdesc="GNOME Shell extension to synchronize your user icon with Gravatar"
arch=('any')
url="https://github.com/jrouleau/gnome-shell-extensions-gravatar"
install=${pkgname%-git}.install
license=('MIT')
depends=('gnome-shell>=3.32')
makedepends=('git' 'glib2')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%-git}/src"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  install -dm755 "${destdir}"
  install -dm755 "${destdir}/lib"
  install -Dm644 "${srcdir}/${pkgname%-git}/src/schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
  cp -r * "${destdir}"
  cp -r "${srcdir}/${pkgname%-git}/lib/" "${destdir}"
  #rebuild compiled GSettings schemas if missing
  if [[ ! -f "${destdir}/schemas/gschemas.compiled" ]]; then
    glib-compile-schemas "${destdir}/schemas"
  fi
}
