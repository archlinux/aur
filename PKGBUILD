# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Nep_Nep <nepnep91 at child dot pizza>
# Contributor: Tim Paik <timpaik@163.com>
pkgname=gnome-shell-extension-quick-settings-tweaks-git
_uuid=quick-settings-tweaks@qwreey
pkgver=2.1.stable.r19.g7a4d3e1
pkgrel=1
pkgdesc="A GNOME extension which allows you to customize the new Quick Settings Panel to your liking"
arch=('any')
url="https://github.com/qwreey75/quick-settings-tweaks"
license=('LGPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'npm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/qwreey75/quick-settings-tweaks.git')
sha256sums=('SKIP')

pkgver() {
  cd quick-settings-tweaks
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd quick-settings-tweaks
}

build() {
  cd quick-settings-tweaks
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  TARGET=release ./install.sh create-release
}

package() {
  cd quick-settings-tweaks
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "target/${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/org.gnome.shell.extensions.quick-settings-tweaks.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
