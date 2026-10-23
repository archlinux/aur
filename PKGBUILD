# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=gnome-shell-extension-dynamic-music-pill
pkgver=1.6
pkgrel=1
pkgdesc="A highly customizable music widget for GNOME Shell"
arch=(any)
url=https://github.com/Andbal23/dynamic-music-pill
license=(GPL-3.0-or-later)
depends=(gnome-shell)
optdepends=("cava: real-time visualizer")
makedepends=(git jq)
source=($pkgname::git+$url.git#tag=v$pkgver)
sha256sums=('3ac878f588e78e04a66016abc232ee0565d4a5449ce62be8ece1a44cf88319a1')

build() {
  cd $pkgname

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  mkdir "$uuid"
  glib-compile-schemas --targetdir="$uuid/" schemas
}

package() {
  cd $pkgname

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "${destdir}"
  cp -rav locale po src *.js *.json *.css "${destdir}/"
  install -Dm0644 "${uuid}/gschemas.compiled" "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}

# vim: set ts=2 sw=2 et:
