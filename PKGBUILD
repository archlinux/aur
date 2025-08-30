# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-bluetooth-battery-meter-git
pkgver=030.r70.g11a137c
pkgrel=1
pkgdesc="A GNOME extension that displays indicator icons in the system tray, acting as a meter for Bluetooth device battery levels."
arch=('any')
url="https://github.com/maniacx/Bluetooth-Battery-Meter"
license=('GPL-3.0-or-later')
depends=(
  'bluez'
  'gnome-shell'
)
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/maniacx/Bluetooth-Battery-Meter.git')
sha256sums=('SKIP')

pkgver() {
  cd Bluetooth-Battery-Meter
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-GNOME45//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Bluetooth-Battery-Meter
  gnome-extensions pack ./ \
    --extra-source=icons/ \
    --extra-source=lib/ \
    --extra-source=preferences/ \
    --extra-source=script/ \
    --extra-source=ui/ \
    --podir=po \
    --force
}

package() {
  cd Bluetooth-Battery-Meter
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  # Does not detect icons in system
#  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"/{icons,locale} "$pkgdir/usr/share/"

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
