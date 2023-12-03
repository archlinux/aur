# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>

# shellcheck disable=SC2034 disable=SC2148 disable=SC2154 disable=SC2001
_pkgname=code-insiders
pkgname="$_pkgname-bin"
pkgver=1.85.0_1701458561
pkgrel=1
pkgdesc="Code editing. Redefined."
arch=('x86_64')
url="https://code.visualstudio.com/insiders/"
license=('custom: commercial')
depends=(libxkbfile gnupg gtk3 libsecret nss gcc-libs libnotify libxss glibc lsof)
optdepends=('glib2: Needed for move to trash functionality'
  'libdbusmenu-glib: Needed for KDE global menu')
conflicts=(visual-studio-code-insiders-bin)
_download_url="https://code.visualstudio.com/sha/download?build=insider&os=linux-deb-x64"

pkgver_check() {
  IFS='/' read -ra URL <<<"$(curl -ILs -w "%{url_effective}" -o /dev/null "$_download_url")"
  echo "${URL[7]}" | sed -e 's/code-insiders_\(.*\)_amd64.deb/\1/' -e 's/-/_/'
}
_pkgver=$(pkgver_check)
pkgver() {
  echo "$_pkgver"
}

source=("${_pkgname}_${_pkgver}.deb::$_download_url")
sha256sums=('SKIP')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  replacement="s|\(Exec=[^%]*\)\(%.*\)|\1--no-sandbox \2|"
  sed -i "$replacement" "$pkgdir/usr/share/applications/code-insiders.desktop"
  sed -i "$replacement" "$pkgdir/usr/share/applications/code-insiders-url-handler.desktop"

  mkdir "$pkgdir/usr/bin"
  ln -s /usr/share/code-insiders/bin/code-insiders "$pkgdir/usr/bin/code-insiders"
}
