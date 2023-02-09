# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: sanduhrs <stefan.auditor@erdfisch.de>
pkgname=gnome-shell-extension-caffeine-git
_uuid=caffeine@patapon.info
pkgver=44.r4.gd4c4897
pkgrel=1
pkgdesc="Disable the screensaver and auto suspend"
arch=('any')
url="https://github.com/eonpatapon/gnome-shell-extension-caffeine"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/eonpatapon/gnome-shell-extension-caffeine.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make build

  cd "$_uuid"
  gnome-extensions pack \
    --extra-source=icons/ \
    --extra-source=preferences/ \
    --force
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf "$_uuid/$_uuid.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.caffeine.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"

  cd "$_uuid/locale"
    for locale in */; do
      install -Dm644 "${locale}/LC_MESSAGES"/*.mo -t \
        "$pkgdir/usr/share/locale/${locale}/LC_MESSAGES/"
    done
}
