# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-bluetooth-battery-indicator-git
_uuid=bluetooth-battery@michalw.github.com
pkgver=r59.12beac8
pkgrel=1
pkgdesc="GNOME Shell extension displaying battery percentage for bluetooth devices"
arch=('any')
url="https://github.com/MichalW/gnome-bluetooth-battery-indicator"
license=('GPL-3.0-or-later')
depends=('gnome-shell' 'python-pybluez')
makedepends=('git')
optdepends=('bluez-utils: Get battery levels using bluetoothctl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-bluetooth-battery-indicator')
replaces=('gnome-bluetooth-battery-indicator-git')
source=('git+https://github.com/MichalW/gnome-bluetooth-battery-indicator.git'
        'git+https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-bluetooth-battery-indicator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd gnome-bluetooth-battery-indicator
  git submodule init
  git config submodule.Bluetooth_Headset_Battery_Level.url \
    "$srcdir/Bluetooth_Headset_Battery_Level"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd gnome-bluetooth-battery-indicator
  make translation
  make build
}

package() {
  cd gnome-bluetooth-battery-indicator
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.bluetooth_battery.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -r "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  # Remove duplicate GPL3 license & README
  rm "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"{LICENSE,README.md}
}
