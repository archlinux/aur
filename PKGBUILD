# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=gnome-shell-extension-tiling-assistant
_uuid=tiling-assistant@leleat-on-github
pkgver=56
pkgrel=1
pkgdesc="A GNOME Shell extension which adds a Windows-like snap assist to the GNOME desktop"
arch=('any')
url="https://github.com/ubuntu/Tiling-Assistant"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git')
install='tiling-assistant.install'
source=("git+https://github.com/ubuntu/Tiling-Assistant.git#tag=v$pkgver")
sha256sums=('3e5f44e2296cb378b96074948cac46e04599c0e6dfa5ee81619228dbeb178dd4')

build() {
  cd Tiling-Assistant
  gnome-extensions pack "${_uuid}" \
    --podir=../translations/ \
    --extra-source=media/ \
    --extra-source=src/ \
    --force
}

package() {
  cd Tiling-Assistant
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dvm644 "${_uuid}"/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
