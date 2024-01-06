# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-bluetooth-battery-meter-git
_uuid=Bluetooth-Battery-Meter@maniacx.github.com
pkgver=r1.7d69349
pkgrel=1
pkgdesc="An extension featuring indicator icons in the system tray, serving as a meter for Bluetooth device battery levels."
arch=('any')
url="https://github.com/maniacx/Bluetooth-Battery-Meter"
license=('GPL3')
depends=('bluez' 'gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/maniacx/Bluetooth-Battery-Meter.git')
sha256sums=('SKIP')

pkgver() {
  cd Bluetooth-Battery-Meter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Bluetooth-Battery-Meter
  gnome-extensions pack ./ \
    --extra-source=icons/ \
    --extra-source=lib/ \
    --extra-source=preferences/ \
    --extra-source=ui/ \
    --podir=po \
    --force
}

package() {
  cd Bluetooth-Battery-Meter
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  # Does not detect icons in system and no locale yet
#  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"/{icons,locale} "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.Bluetooth-Battery-Meter.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
