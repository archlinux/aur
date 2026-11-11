# Maintainer: xtermium <support@xtermium.com>
# Repackages the nightly build's .deb: main as it stands, built every night it changed. It
# replaces the release (same app, same data in ~/.xtermium). pkgver is the build time, from the
# `nightly` release's name; the file's URL never changes, so a new build fails the checksum until
# the bump (aur.yml) has run.
pkgname=xtermium-nightly-bin
_pkgname=xtermium
pkgver=20261110.035328
pkgrel=1
pkgdesc='Cross-platform terminal and session manager with web/file browsers and AI (nightly build)'
arch=('x86_64')
url='https://xtermium.com'
license=('Apache-2.0')
# libayatana-appindicator is loaded at run time for the tray icon (Settings > Keep running).
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'hicolor-icon-theme'
         'libayatana-appindicator' 'libsoup3' 'systemd-libs' 'webkit2gtk-4.1')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.deb::https://github.com/xtermium/xtermium/releases/download/nightly/${_pkgname}_nightly_amd64.deb")
sha256sums=('d39db270a58238f05b8b1404771ace9c16885279d9eee1125e61192a6bc4ec46')

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
