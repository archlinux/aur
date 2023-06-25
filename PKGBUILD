# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
_pkgname=blur-my-shell
pkgver=47
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('45f29cbda63ddda58ace58fc0538920d9fecadb3c73d75113663a62cb699f287')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  _uuid="${_pkgname}@aunetx"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf build/${_uuid}.shell-extension.zip \
    -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 "schemas/org.gnome.shell.extensions.${_pkgname}.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  install -d "$pkgdir/usr/share/locale"
  cp -r "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale/"* \
    "$pkgdir/usr/share/locale/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"{locale,schemas}
}
