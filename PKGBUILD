# Maintainer: Boria138 <boriabloger at protonmail dot com>
# Contributor: Stevezxc <stevezhou586 at gmail dot com>
pkgname=gnome-shell-extension-gjs-osk-git
_uuid=gjsosk@vishram1123.com
pkgver=r234.c279187
pkgrel=1
pkgdesc="A (marginally) better on screen keyboard for GNOME 45+."
arch=('any')
url="https://github.com/Vishram1123/gjs-osk"
license=('GPL-3.0-only')
depends=('dconf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Vishram1123/gjs-osk.git')
sha256sums=('SKIP')

prepare() {
	cd gjs-osk
	sed -i "s|let extract_dir = .*|let extract_dir = \"/usr/share/gnome-shell/extensions/${_uuid}/\";|g" ${_uuid}/extension.js
}

pkgver() {
  cd gjs-osk
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "gjs-osk/${_uuid}"
  gnome-extensions pack --force --extra-source=ui --extra-source=physicalLayouts.json
}

package() {
  cd "gjs-osk/${_uuid}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
  install -d  "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/keycodes"
  tar -xvJf keycodes.tar.xz -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/keycodes" --no-same-owner
  install -Dm644 schemas/org.gnome.shell.extensions.gjsosk.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
