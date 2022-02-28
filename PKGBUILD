# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=55
pkgrel=1
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:41')
makedepends=('glib2')
source=($url/-/archive/$pkgver/$_pkgname-$pkgver.tar)
b2sums=('1bf98e85b2fa7730c88e562adc74747b0dc4a8e1a2e1b87bb8bc6c7a00605c1ace0d84a80d1765306a964d5fe1e3445c64fe2363c1676f2885c7e86d1c4529bb')

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
