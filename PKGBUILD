# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=59
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:41')
makedepends=('glib2')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('40abdf32ff12eb718fdc956f67166f165d6c8855f5424128a0985dd4abf84fb2e43ca2825e38e6a8051483caa910adbec1e3ddbd6221db77ffdabe7ef90be4fd')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}/build/${uuid}.shell-extension.zip" \
    -C "${srcdir}/${_pkgname}-${pkgver}/build"
  rm "${srcdir}/${_pkgname}-${pkgver}/build/${uuid}.shell-extension.zip"
  install -dm755 "${destdir}"
  cp -r * "${destdir}"
  install -Dm644 "schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}
