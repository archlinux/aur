# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-display-brightness-ddcutil-git
_uuid=display-brightness-ddcutil@themightydeity.github.com
pkgver=r177.b448326
pkgrel=1
pkgdesc="Display brightness slider for gnome shell using ddcutil backend"
arch=('any')
url="https://github.com/daitj/gnome-display-brightness-ddcutil"
license=('GPL-3.0-or-later')
depends=('ddcutil' 'gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/daitj/gnome-display-brightness-ddcutil.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-display-brightness-ddcutil
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gnome-display-brightness-ddcutil
  make
}

package() {
  cd gnome-display-brightness-ddcutil
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "dist/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 README.md screenshot.jpg -t "$pkgdir/usr/share/doc/${pkgname%-git}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.display-brightness-ddcutil.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
