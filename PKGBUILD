# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
pkgname=gnome-shell-extension-background-logo
_uuid=background-logo@fedorahosted.org
pkgver=47.0
pkgrel=1
pkgdesc="GNOME Shell extension to overlay a logo over the default background"
arch=('any')
url="https://pagure.io/background-logo-extension"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'meson')
source=("git+https://pagure.io/background-logo-extension.git#tag=$pkgver"
        'archlinux-gnome.svg')
sha256sums=('c5301aebb493f98c40fccd870afd73c3e400636d7f7b8aebc62cac55a1b20c52'
            'ae3223dab86d51ed54ac22c0518102bcd965fe0576839a038e559301cf94cc2c')

prepare() {
  cd background-logo-extension
  sed -i "s#fedora-logos/fedora_lightbackground.svg#gnome-shell/extensions/${_uuid}/archlinux-gnome.svg#; \
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
