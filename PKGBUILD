# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=gnome-shell-extension-lockkeys
pkgver=75
pkgrel=1
pkgdesc="Lock key state indicator for GNOME Shell."
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-lockkeys"
license=('GPL-2.0-only')
depends=('gnome-shell' 'hicolor-icon-theme')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('dd91ad38be8e3a307f9e1eaf79bb0d4d08f7eb5b401ad5de191c5e1769c8895f')
sha512sums=('0b222630ee763de02110487bebb1a40c7020afffb6ac911177c7bc9f3e68ed5585910c2e0be0de8add1d7d0179fa99d63b86daa2a3803fac476a1c8fbeac11bb')

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
