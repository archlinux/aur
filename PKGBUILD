# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=gnome-shell-extension-lockkeys
pkgver=74
pkgrel=1
pkgdesc="Lock key state indicator for GNOME Shell."
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-lockkeys"
license=('GPL-2.0-only')
depends=('gnome-shell' 'hicolor-icon-theme')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('1bbd6729c7b3afee322b9be71e39c386155034f2726bbe4972b5282d2e76de08')
sha512sums=('9ce5c1af3a9bb1fd0d8913196ff54ea403ae6fc021fa2844f394ce6c36f9b216bb9207a6172b7037831c358b4c1dc6cfe796eeee0ca2ca7cb7f74cf0449a978c')

package() {
  local extension_dir="$srcdir/$pkgname/lockkeys@vaina.lt"
  [[ -f "$extension_dir/metadata.json" ]]
  cd "$extension_dir"

  local extension_name
  extension_name=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)

  local destination_dir="${pkgdir}/usr/share/gnome-shell/extensions/${extension_name}"

  # Copy extension files into place.
  find . -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${destination_dir}" '{}' +
  find . -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${destination_dir}/icons" '{}' +
  find . -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  local locale
  for locale in locale/*/
  do
    install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
  done
}
