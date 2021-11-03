# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-bluetooth-battery-indicator-git
pkgver=r31.16e39f2
pkgrel=1
pkgdesc="Gnome-Shell extension displaying battery percentage for bluetooth devices"
arch=('any')
url="https://github.com/MichalW/gnome-bluetooth-battery-indicator"
license=('GPL3')
depends=('gnome-shell' 'python-pybluez')
makedepends=('git')
optdepends=('bluez-utils: Get battery levels using bluetoothctl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/MichalW/gnome-bluetooth-battery-indicator.git'
        'https://github.com/MichalW/gnome-bluetooth-battery-indicator/pull/25.patch'
        'git+https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level.git')
sha256sums=('SKIP'
            'aeb9f880715e8ceebecceb434bd2c2ea3c17c9873d339a5d8861a9950dfc4a09'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  git config submodule.Bluetooth_Headset_Battery_Level.url \
    "$srcdir/Bluetooth_Headset_Battery_Level"
  git submodule update

  # pack scripts folder
  patch -Np1 -i "$srcdir/25.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make translation
  make build
}

package() {
  _uuid='bluetooth-battery@michalw.github.com'
  _schema='org.gnome.shell.extensions.bluetooth_battery.gschema.xml'

  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"
  bsdtar xvf "$_uuid.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -d "$pkgdir/usr/share/glib-2.0/schemas/"
  ln -s "/usr/share/gnome-shell/extensions/$_uuid/schemas/$_schema" \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  # Remove unnecessary files
  find "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/Bluetooth_Headset_Battery_Level" \
    -type f ! -name '*.py' -delete
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/LICENSE"
}
