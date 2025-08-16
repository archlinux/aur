# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-battery-health-charging-git
pkgver=74.r10.g874186d
pkgrel=1
pkgdesc="An extension to maximize the battery life of laptops by setting their charging threshold/modes."
arch=('any')
url="https://github.com/maniacx/Battery-Health-Charging"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'polkit'
)
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=battery-health-charging.install
source=('git+https://github.com/maniacx/Battery-Health-Charging.git')
sha256sums=('SKIP')

pkgver() {
  cd Battery-Health-Charging
  git describe --long --tags --abbrev=7 | sed 's/^v0//;s/-GNOME45//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Battery-Health-Charging
  gnome-extensions pack ./ \
    --extra-source=devices/ \
    --extra-source=icons/ \
    --extra-source=lib/ \
    --extra-source=preferences/ \
    --extra-source=resources/ \
    --extra-source=tool/ \
    --extra-source=ui/ \
    --podir=po \
    --force
}

package() {
  cd Battery-Health-Charging
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
