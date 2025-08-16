# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-rounded-corners-git
pkgver=r37.a0c2adc
pkgrel=1
pkgdesc="Adds rounded corners to every monitor in GNOME."
arch=('any')
url="https://github.com/lennart-k/gnome-rounded-corners"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'zip'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lennart-k/gnome-rounded-corners.git')
sha256sums=('SKIP')

pkgver() {
  cd gnome-rounded-corners
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd gnome-rounded-corners
  make zip
}

package() {
  cd gnome-rounded-corners
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
