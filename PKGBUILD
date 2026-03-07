# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-notification-configurator-git
pkgver=2.1.0.r0.g1eeeb6b
pkgrel=1
pkgdesc="Ultimate Notification Configurator for GNOME"
arch=('any')
url="https://github.com/ExposedCat/gnome-notification-configurator"
license=('LGPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'npm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ExposedCat/gnome-notification-configurator.git')
sha256sums=('SKIP')

pkgver() {
  cd gnome-notification-configurator
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gnome-notification-configurator
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  npm run build
}

package() {
  cd gnome-notification-configurator
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  cp -rv dist/* "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale/" "$pkgdir/usr/share/"

  install -Dvm644 dist/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
