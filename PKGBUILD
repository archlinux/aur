# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
pkgname=gnome-shell-extension-background-logo
_uuid=background-logo@fedorahosted.org
pkgver=46.0
pkgrel=1
pkgdesc="GNOME Shell extension to overlay a logo over the default background"
arch=('any')
license=('GPL-3.0-or-later')
url="https://pagure.io/background-logo-extension"
depends=('gnome-shell')
makedepends=('git' 'meson')
source=("git+https://pagure.io/background-logo-extension.git#tag=$pkgver"
        'archlinux-gnome.svg')
sha256sums=('7cee72ed99c58f362e845e773f7f7ada217902ffe4bbb1f1d279bcc589be5c96'
            '80ed897a3d1d5ad709147a97572d062abcdc61487d3d1f8882b8b1373943fe15')

prepare() {
  cd background-logo-extension
  sed -i "s#fedora-logos/fedora_lightbackground.svg#gnome-shell/extensions/${_uuid}/archlinux-gnome.svg#;\
    s#fedora-logos/fedora_darkbackground.svg#gnome-shell/extensions/${_uuid}/archlinux-gnome.svg#" \
    schemas/org.fedorahosted.background-logo-extension.gschema.xml
}

build() {
  arch-meson background-logo-extension build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "$srcdir/archlinux-gnome.svg" -t \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"
}
