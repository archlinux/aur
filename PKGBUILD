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
sha512sums=('4f5608a19b0929adccc0245ec8abeff03011d40f51711c57599994950d1070a5babe4c47a2f1e02f53e39afd1ec46b70ff19c428a7804f23dc74bee2809e9ed1')

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
