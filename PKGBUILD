# Maintainer: xtermium <support@xtermium.com>
# Repackages the release's .deb (built on Ubuntu 22.04, glibc 2.35+).
pkgname=xtermium-bin
_pkgname=xtermium
pkgver=0.10.0
pkgrel=1
pkgdesc='Cross-platform terminal and session manager with web/file browsers and AI'
arch=('x86_64')
url='https://xtermium.com'
license=('Apache-2.0')
# libayatana-appindicator is loaded at run time for the tray icon (Settings > Keep running).
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'hicolor-icon-theme'
         'libayatana-appindicator' 'libsoup3' 'systemd-libs' 'webkit2gtk-4.1')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("https://github.com/xtermium/xtermium/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('926fbbf131b682eb2e9cb8d1e020c1870efab4037dfeb2a60ee65025cca49fdc')

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  cd "$pkgdir/usr/share"
  # The .deb puts the 256 px icon in hicolor/256x256@2, which no icon theme reads.
  mv icons/hicolor/256x256@2 icons/hicolor/256x256
  # The .deb's desktop file has an empty Categories=.
  sed -i 's/^Categories=$/Categories=System;TerminalEmulator;/' applications/$_pkgname.desktop
  install -d licenses/$pkgname
  ln -s /usr/lib/$_pkgname/LICENSE /usr/lib/$_pkgname/NOTICE licenses/$pkgname/
}
