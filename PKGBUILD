# SPDX-License-Identifier: 0BSD
# Maintainer: jaytau <95355656+jay-tau@users.noreply.github.com>

pkgname=socketsweep-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Android storage analyzer with an interactive treemap'
arch=('x86_64')
url='https://github.com/VishnuSrivatsava/SocketSweep'
license=('GPL-3.0-only')
depends=('android-tools' 'cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'hicolor-icon-theme' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
optdepends=('android-udev: additional udev rules for Android devices')
provides=("socketsweep=$pkgver")
conflicts=('socketsweep')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/SocketSweep_${pkgver}_amd64.deb")
sha256sums=('978d3d2fd692e457ea12c14ca70102c8a065d94cb7b11a63d8136999efb3a6cf')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  mv "$pkgdir/usr/bin/tauri-app" "$pkgdir/usr/bin/socketsweep"
  ln -sf /usr/bin/adb "$pkgdir/usr/lib/SocketSweep/bin/adb"
  for icon in "$pkgdir"/usr/share/icons/hicolor/*/apps/tauri-app.png; do
    mv "$icon" "${icon%tauri-app.png}socketsweep.png"
  done
  sed -i -e 's/=tauri-app$/=socketsweep/' \
         -e 's/^Categories=$/Categories=Utility;/' \
         -e "s/^Comment=.*/Comment=$pkgdesc/" \
         "$pkgdir/usr/share/applications/SocketSweep.desktop"
}
