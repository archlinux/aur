# Maintainer: Janek Thomaschewski <janek@jbbr.net>
# Maintainer: Stephan Springer <buzo+arch@Lini.de>

pkgname=signal-desktop-bin
pkgver=1.29.3
pkgrel=1
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/signalapp/Signal-Desktop'
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'xdg-utils' 'libxss')
optdepends=('hunspell-en_US: US English hunspell dictionaries')
provides=('signal-desktop')
conflicts=('signal' 'signal-desktop')
options=('!strip')
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${pkgver}_amd64.deb")
sha256sums=('21c071a483b94d0fd820eae7a6bb617539da5b9026e54040697e735e793672e6')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # fix permissions in 1.9.0+ (Some directories have now 775; changing them back to 755)
  find "${pkgdir}" -type d -not -perm 755 -exec chmod 755 {} \;

  # fix crash on some systems due https://github.com/signalapp/Signal-Desktop/issues/3536
  chmod 4755 "${pkgdir}/opt/Signal/chrome-sandbox"

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
