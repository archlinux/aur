# Maintainer: Marcel Bobolz <ergotamin.source at gmail dot com>
# Contributor: visit ""
pkgname=('slimjet-browser')
_origname='slimjet'
pkgver=21.0.6.0
pkgrel=1
pkgdesc="A lightweight Browser based on Blink (without setuid-sandbox)"
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
  "flashpeak.patch"
  "slimjet-browser")
install='slimjet-browser.install'
sha256sums=('84e1be84169770e17dcd4445af1b4361f7791950fd8d0247f77be2d1aee80b95'
            'fc0297ac9ec689eeb610024c9f59d5f47661d5e1fdf18bd3c5e456068c47d15e'
            '9ec7ee8938b2f88fe0130abe4aa886a90da97003bfc08d20937612d75ee9f228'
            '09f3bdf4ff2545b755c76150992268d0febdc163a59880bc1a60c82ebd372e3d')

package() {
  msg2 "Extracting data.tar.xz of ${pkgname}-${pkgver}-${arch}.deb ..."
  # needed
  bsdtar -xpf "data.tar.xz"
  #-
  msg2 "Sanitizing extracted file-tree ..."
  # trash
  rm -f 'control.tar.gz' 'debian-binary'
  rm -f "usr/bin/flashpeak-slimjet"
  rm -rf "usr/share/doc"
  # license
  mkdir -p "usr/share/licenses/${pkgname}"
  install "${srcdir}/LICENSE" "usr/share/licenses/${pkgname}"
  # icon-format->PNG
  $(command -v convert) "usr/share/pixmaps/slimjet.xpm" "usr/share/pixmaps/slimjet.png" &>/dev/zero
  sed 's%^Exec=/usr/bin/flashpeak-slimjet%Exec=/usr/bin/slimjet-browser%g' -i "usr/share/applications/slimjet.desktop"
  sed 's%^Icon=flashpeak-slimjet%Icon=slimjet%g' -i "usr/share/applications/slimjet.desktop"
  # deleted check for slimjet-sandbox
  patch "opt/slimjet/flashpeak-slimjet" < "${srcdir}/flashpeak.patch"
  # removing deprecated setuid-sandbox, namespaced-sandbox will be used
  rm -f "opt/slimjet/slimjet-sandbox"
  mv "opt/slimjet" "usr/share/slimjet"
  # cleanup
  rm -rf "opt"
  # setup kernel to permit namespaced sandbox, and
  # if run as root, the dummy user slim-root executes slimjet
  install -m0755 "${srcdir}/slimjet-browser" "usr/bin/slimjet-browser"
  #-
  msg2 "Moving sanitized file-tree to package-directory ..."
  # moving to target-directory
  mv --target-directory="${pkgdir}" usr
  # setting correct permissions
  chmod -R 0755 "${pkgdir}/"
  # done
  msg2 "Finished packaging !"
  # enjoy !
}
