# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-material-you-theme-git
_uuid='material-you-theme@asubbiah.com'
pkgver=r102.c8f3356
pkgrel=1
pkgdesc="Applies generated libadwaita theme from wallpaper using Material You"
arch=('any')
url="https://github.com/avanishsubbiah/material-you-theme"
license=('GPL3')
depends=('adw-gtk3' 'gnome-shell')
makedepends=('git' 'npm')
optdepends=('gdm-tools: set the GDM theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/avanishsubbiah/material-you-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/material-you-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/material-you-theme"
}

build() {
  cd "$srcdir/material-you-theme"

  # Does not detect system Node.js, NPM, or SassC, 
  # so we'll install in the extension folder like it tries to do anyway
  export npm_config_cache="$srcdir/npm_cache"
  npm install --prefix "${_uuid}"

  make update-po
  make build
}

package() {
  cd "$srcdir/material-you-theme"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.material-you-theme.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
