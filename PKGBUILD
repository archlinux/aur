# Maintainer: Janek Thomaschewski <janek@jbbr.net>
# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=signal-desktop-bin
pkgver=1.24.1
pkgrel=4
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/signalapp/Signal-Desktop'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'xdg-utils' 'libxss')
optdepends=('hunspell-en_US: US English hunspell dictionaries')
provides=('signal-desktop')
conflicts=('signal')
options=('!strip')
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${pkgver}_amd64.deb")
sha256sums=('392a8ce97b8a41ee9f55d39b07ce7a6c7b591c5cc607d5b22d323ed849e7b9a4')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # fix permissions in 1.9.0+ (Some directories have now 775; changing them back to 755)
  find "${pkgdir}" -type d -not -perm 755 -exec chmod 755 {} \;

  # install symbolic link in /usr/bin
  install -d -m755 "${pkgdir}/usr/bin"
  ln -s /opt/Signal/signal-desktop "${pkgdir}/usr/bin"

  # add action for starting in tray only
  cat << EOD >> "${pkgdir}/usr/share/applications/signal-desktop.desktop"
Actions=Tray;
[Desktop Action Tray]
Exec="/opt/Signal/signal-desktop" --start-in-tray %U
Name=Start in Tray
EOD

  # use native Hunspell dictionaries
  # unfortunately only US-English is supported, see https://github.com/signalapp/Signal-Desktop/issues/1659
  rm -r "${pkgdir}"/opt/Signal/resources/app.asar.unpacked/node_modules/spellchecker/vendor/hunspell_dictionaries
  ln -s /usr/share/hunspell \
     "${pkgdir}"/opt/Signal/resources/app.asar.unpacked/node_modules/spellchecker/vendor/hunspell_dictionaries
}
