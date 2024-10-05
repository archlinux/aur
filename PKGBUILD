# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>

# shellcheck disable=SC2034 disable=SC2148 disable=SC2154 disable=SC2001
_pkgname=code-insiders
pkgname="$_pkgname-bin"
pkgver=1.95.0_1728049707
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
  sed -e "s/${_pkgname}_\(.*\)_amd64.deb/\1/" -e 's/-/_/' <<<"${URL[7]}"
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
  sed -i "$replacement" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  sed -i "$replacement" "$pkgdir/usr/share/applications/$_pkgname-url-handler.desktop"

  mkdir "$pkgdir/usr/bin"
  ln -s /usr/share/$_pkgname/bin/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
