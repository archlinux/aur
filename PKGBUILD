# Maintainer: Crotok <crotok [at] mailbox [dot] org>

pkgname=streamstudio-bin
pkgver=2.9.9.6
pkgrel=1
pkgdesc="Provide a popcorntime clone for streaming movies directly from T411, Cpasbien, Songza, Twitch, Piratebay, Youtube and Dailymotion"
arch=('x86_64' 'i686')
url="https://www.streamstudio.me/"
license=('GPL3')
depends=('libnotify' 'desktop-file-utils' 'ttf-font' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('ttf-liberation: open source ttf fonts')
provides=('streamstudio')
conflicts=('streamstudio')
options=('!strip')
install="streamstudio.install"
sha256sums=('443db793bd052bbf2bd8c146b61144d75a12ff7ce600ddd838447ce7fd8d0fbe'
            'c6b4c4d002b1e16692ce861ef80b37946b047bf8243e0fcb450235d66ea79f90'
            '4dc8715a81bfd1297f99b3e5f41f9f50936bbf7779b9bc4ef9231261053b76ea')

_platform='64'

if [ "$CARCH" = 'i686' ]; then
  _platform='32'
  sha256sums[0]='e0d41d7afdfbcda8afa86a6da0a8d5d81b0df7278c066c62dd31ecd69d76ca09'
fi

source=("https://streamstudio.me/StreamStudio/streamstudio-${_platform}.zip"
        "streamstudio.desktop"
        "streamstudio.install")

package() {
  cd "${srcdir}"

  # Fix permissions
  find . -type d -exec chmod 755 {} \; 
  find . -type f -exec chmod 644 {} \;

  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share"

  # Program
  echo "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/streamstudio" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/nw.pak" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/libffmpegsumo.so" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/ffmpeg" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/icudtl.dat" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/package.json" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/config.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/index.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/playlist.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/selectdir.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/update.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/warning.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/VERSION" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/gpl-2.0.txt" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/1204.sh" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/CHANGELOG" "${pkgdir}/opt/${pkgname}/"

  # Directories
  cp -a "${srcdir}/css" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/fonts" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/images" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/js" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/locales" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/node_modules" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/setup-images" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/subtitles" "${pkgdir}/opt/${pkgname}/"

  # Link to program
  ln -s "/opt/${pkgname}/streamstudio" "${pkgdir}/usr/bin/streamstudio"

  # Desktop file
  install -Dm644 "${srcdir}/streamstudio.desktop" "${pkgdir}/usr/share/applications/streamstudio.desktop"

  # Icon
  install -Dm644 "${srcdir}/images/logo.png" "${pkgdir}/usr/share/pixmaps/streamstudio.png"

  # Force youtube-dl write attribute (for auto-updating)
  chmod 777 "${pkgdir}/opt/${pkgname}/node_modules/youtube-dl/bin/youtube-dl"

  # Force ffmpeg execute attribute
  chmod +x "${pkgdir}/opt/${pkgname}/ffmpeg"
}
