# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-bluetooth-battery-indicator-git
pkgver=r67.2637025
pkgrel=1
pkgdesc="GNOME Shell extension displaying battery percentage for bluetooth devices"
arch=('any')
url="https://github.com/MichalW/gnome-bluetooth-battery-indicator"
license=('GPL-3.0-or-later')
depends=(
  'gnome-shell'
  'python-pybluez'
)
makedepends=(
  'git'
  'jq'
)
optdepends=('bluez-utils: Get battery levels using bluetoothctl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-bluetooth-battery-indicator')
source=('git+https://github.com/MichalW/gnome-bluetooth-battery-indicator.git'
        'git+https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-bluetooth-battery-indicator
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"{LICENSE,README.md}
}
