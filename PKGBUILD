# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-notification-configurator-git
_uuid=notification-configurator@exposedcat
pkgver=r22.896266e
pkgrel=1
pkgdesc="Advanced GNOME notification capabilities including rate limiting, custom color theming per application, and notification positioning"
arch=('any')
url="https://github.com/ExposedCat/gnome-notification-configurator"
license=('LGPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'npm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ExposedCat/gnome-notification-configurator.git')
sha256sums=('SKIP')

pkgver() {
  cd gnome-notification-configurator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd gnome-notification-configurator
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run build
}

package() {
  cd gnome-notification-configurator
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  cp -r dist/* "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  install -Dm644 dist/schemas/org.gnome.shell.extensions.notification-configurator.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
