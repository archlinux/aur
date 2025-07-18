# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-material-you-colors-git
_uuid=material-you-colors@francescocaracciolo.github.io
pkgver=29.r0.gf69b088
pkgrel=1
pkgdesc="Applies generated libadwaita theme from wallpaper using Material You"
arch=('any')
url="https://github.com/FrancescoCaracciolo/material-you-colors"
license=('GPL-3.0-or-later')
depends=(
  'adw-gtk-theme'
  'gnome-shell'
  'nodejs'
)
makedepends=(
  'git'
  'npm'
)
optdepends=(
  'gdm-tools: GDM theming'
  'gnome-shell-extensions: GNOME Shell theming via User Themes extension'
  'python: Python backend'
  'python-pywal: Pywal theming'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-shell-extension-material-you-theme')
source=('git+https://github.com/FrancescoCaracciolo/material-you-colors.git')
sha256sums=('SKIP')

pkgver() {
  cd material-you-colors
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd material-you-colors

  # Does not detect system Node.js, NPM, or SassC, 
  # so we'll install in the extension folder like it tries to do anyway
  export npm_config_cache="$srcdir/npm_cache"
  npm install --prefix "${_uuid}"

  make
}

package() {
  cd material-you-colors
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  cp -r "${_uuid}/node_modules" "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.material-you-theme.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.material-you-colors.gschema.xml"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
