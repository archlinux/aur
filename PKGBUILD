# Maintainer: GrzegorzKozub <grzegorz.kozub@gmail.com>

pkgname=gnome-shell-extension-rounded-window-corners-reborn-git
pkgdesc='A GNOME Shell extension that adds rounded corners for all windows'
url='https://github.com/flexagoon/rounded-window-corners'
license=('GPL-3.0-or-later')

pkgver=r293.d75b2b4
pkgrel=1

arch=('any')
depends=('gnome-shell')
makedepends=('gettext' 'git' 'just' 'npm' 'zip')

source=('git+https://github.com/flexagoon/rounded-window-corners.git')
sha256sums=('SKIP')

pkgver() {
  cd rounded-window-corners
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd rounded-window-corners
  export NPM_CONFIG_CACHE=${srcdir}/npm-cache
  just pack
}

package() {
  cd rounded-window-corners

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)
  local extdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d ${extdir}
  bsdtar -xvf "${uuid}.shell-extension.zip" -C ${extdir} --no-same-owner

  mv "${extdir}/locale" "${pkgdir}/usr/share/"

  install -Dm644 \
    "${extdir}/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml" \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -rf "${extdir}/schemas/"
}
