# Maintainer: Christian Schendel <doppelhelix@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-gnome-clipboard-history
pkgver=1.3.2
pkgrel=2
pkgdesc="Gnome Clipboard History is a Gnome extension that saves what you've copied into an easily accessible, searchable history panel."
arch=('any')
url="https://github.com/SUPERCILEX/gnome-clipboard-history"
license=('MIT')
depends=('gnome-shell>=1:40')
makedepends=('git'
             'zip')
conflicts=('gnome-shell-extension-clipboard-indicator')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('08e6de8cf61bfce9f258f0f480e2ec0d15f87656f947a06cec2dd66afb8c3919')

build() {
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  make bundle
}

package() {
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=org.gnome.shell.extensions.clipboard-indicator.gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "bundle.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"

  install -Dm644 "$destdir/schemas/$schema" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"

  cp -r "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale" "$pkgdir/usr/share/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/locale/"

  install -Dm644 "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
  rm -f "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/LICENSE"

  install -Dm644 "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/README.md" -t "$pkgdir/usr/share/doc/${pkgname}"
  rm -f "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/README.md"
}
