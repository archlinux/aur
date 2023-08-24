# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>

# shellcheck disable=SC2034 disable=SC2148 disable=SC2154 disable=SC2001
_pkgname=code-insiders
pkgname="$_pkgname-bin"
pkgver=1.82.0_1692856334
pkgrel=1
pkgdesc="Code editing. Redefined."
arch=('x86_64')
url="https://code.visualstudio.com/insiders/"
license=('custom: commercial')
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('glib2: Needed for move to trash functionality'
  'libdbusmenu-glib: Needed for KDE global menu')
conflicts=(visual-studio-code-insiders-bin)

source=("${_pkgname}_${pkgver}.deb::https://code.visualstudio.com/sha/download?build=insider&os=linux-deb-x64")
sha256sums=('SKIP')

pkgver() {
  IFS='/' read -ra URL <<<"$(curl -ILs -w "%{url_effective}" -o /dev/null "$(echo "${source[0]}" | sed 's/.*:://')")"
  echo "${URL[5]}" | sed -e 's/code-insiders_\(.*\)_amd64.deb/\1/' -e 's/-/_/'
}

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  replacement="s|\(Exec=[^%]*\)\(%.*\)|\1--no-sandbox \2|"
  sed -i "$replacement" "$pkgdir/usr/share/applications/code-insiders.desktop"
  sed -i "$replacement" "$pkgdir/usr/share/applications/code-insiders-url-handler.desktop"

  mkdir "$pkgdir/usr/bin"
  ln -s /usr/share/code-insiders/bin/code-insiders "$pkgdir/usr/bin/code-insiders"
}
