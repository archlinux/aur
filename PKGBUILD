# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-shotzy-git
pkgver=r35.2a1b7bf
pkgrel=1
pkgdesc="Image search on Google Lens, OCR and QR scan directly from the built-in GNOME Screenshot tool"
arch=('any')
url="https://github.com/SamkitJain660/Shotzy"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
optdepends=(
  'tesseract: OCR support'
  'zbar: QR scanning support'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/SamkitJain660/Shotzy.git')
sha256sums=('SKIP')

pkgver() {
  cd Shotzy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd Shotzy
  gnome-extensions pack \
    $(find . -maxdepth 1 -name '*.js' -printf '--extra-source=%f ') \
    --force
}

package() {
  cd Shotzy
   _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
