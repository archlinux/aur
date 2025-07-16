# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-disconnect-wifi-git
_uuid=disconnect-wifi@kgshank.net
pkgver=36.r0.g3bfee21
pkgrel=1
pkgdesc="Adds a disconnect option for Wifi in status menu"
arch=('any')
url="https://github.com/kgshank/gse-disconnect-wifi"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kgshank/gse-disconnect-wifi.git'
        'gnome48.patch')
sha256sums=('SKIP'
            '4b47c331bb8a5670430a18bd9a85a191c20913ce34cd60f455547c156d37a19d')

pkgver() {
  cd gse-disconnect-wifi
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gse-disconnect-wifi

  # GNOME 48
  patch -Np1 -i ../gnome48.patch
}

build() {
  cd gse-disconnect-wifi
  make
}

package() {
  cd gse-disconnect-wifi
  make INSTALL_DIR="$pkgdir/usr/share/gnome-shell/extensions/" install

  install -Dvm644 "${_uuid}/schemas/org.gnome.shell.extensions.disconnect-wifi.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/license"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"{po,schemas}
}
