# Maintainer: Marcel Bobolz <ergotamin.source at gmail dot com>
# Contributor: visit ""
pkgname=('slimjet-browser')
_origname='slimjet'
pkgver=21.0.4.0
pkgrel=1
pkgdesc="A lightweight Browser based on Blink (**added: 'slim-root' sandbox-user)"
arch=('x86_64')
url="http://www.slimjet.com"
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gtk2' 'harfbuzz' 'harfbuzz-icu' 'hicolor-icon-theme' 'xorg-xhost'
  'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'openssl' 'nspr' 'opus' 'snappy' 'speech-dispatcher' 'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
makedepends=('pacman>=4.2.0' 'imagemagick>7.0.0')
options=('!emptydirs' '!strip')
provides=('slimjet-browser')
replaces=('slimjet')
license=('custom:freeware' 'MIT')
source=("${pkgname}-${pkgver}-${arch}.deb::https://www.${_origname}.com/release/archive/${pkgver}/${_origname}_amd64.deb"
  "LICENSE"
  "slimjet-browser")
install='slimjet-browser.install'
sha256sums=('6aaffba334238429f92b5fe29d10c7799ffdb34d1ac94d2fa9e73981d8ac567b'
  'fc0297ac9ec689eeb610024c9f59d5f47661d5e1fdf18bd3c5e456068c47d15e'
  '8ab05210886cda05d2d9c0463e093bd1419ad8dde9dc3f4892149d6cda23bee0')

package() {
  rm -f 'control.tar.gz' 'debian-binary'
  msg2 "Extracting data.tar.xz of ${pkgname}-${pkgver}-${arch}.deb ..."
  bsdtar -xpf "data.tar.xz"
  msg2 "Sanitizing extracted file-tree ..."
  rm -f "usr/bin/flashpeak-slimjet"
  rm -rf "usr/share/doc"
  mkdir -p "usr/share/licenses/${pkgname}"
  install "${srcdir}/LICENSE" "usr/share/licenses/${pkgname}"
  convert "usr/share/pixmaps/slimjet.xpm" "usr/share/pixmaps/slimjet.png" &>/dev/zero
  sed 's%^Exec=/usr/bin/flashpeak-slimjet%Exec=/usr/bin/slimjet-browser%g' -i "usr/share/applications/slimjet.desktop"
  sed 's%^Icon=flashpeak-slimjet%Icon=slimjet%g' -i "usr/share/applications/slimjet.desktop"
  mv "opt/slimjet" "usr/share/slimjet"
  rm -rf "opt"
  install -m0755 "${srcdir}/slimjet-browser" "usr/bin/slimjet-browser"
  msg2 "Moving sanitized file-tree to package-directory ..."
  mv --target-directory="${pkgdir}" usr
  chmod -R 0755 "${pkgdir}/"
  msg2 "Finished packaging !"
}
