# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: mareex <marcus dot behrendt dot 86 at gmail dot com>

pkgname=gnome-shell-extension-lockkeys
pkgver=71
pkgrel=1
pkgdesc="Lock key state indicator for GNOME Shell."
arch=('any')
url="https://github.com/kazysmaster/gnome-shell-extension-lockkeys"
license=('GPL-2.0-only')
depends=('gnome-shell' 'hicolor-icon-theme')
makedepends=('git')
_release_commit=f00ebbb2811cb38b00d6985dfb8f91fbc3052f23
source=("$pkgname::git+$url.git#commit=$_release_commit")
sha256sums=('6cd81c8f54992782fe69dca15b7194ab9f5abd1faf37e35a26fd747198901afe')
sha512sums=('f5dd6ec58e00982d6dd942042a10138089c4b62ed32aba767cc192e3a9f60e12786f230cf03be40a750c4f2633dfc0bce2d65cdefc7a7a643c0c96a6a4d7b527')

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
