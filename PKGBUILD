# Maintainer: Crotok <crotok [at] mailbox [dot] org>

pkgname=streamstudio-bin
pkgver=3.9.2
pkgrel=1
pkgdesc="Provide a popcorntime clone for streaming movies directly from T411, Cpasbien, Songza, Twitch, Piratebay, Youtube and Dailymotion"
arch=('x86_64' 'i686')
url="https://www.streamstudio.cc/"
license=('GPL3')
depends=('libnotify' 'desktop-file-utils' 'ttf-font' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('ttf-liberation: open source ttf fonts')
provides=('streamstudio')
conflicts=('streamstudio')
options=('!strip')
install="streamstudio.install"
sha256sums=('eabdf4377716125aab50693422ef0df367d90894c350d9ddbb6a9b48f07a1a82'
            'b082d39935fd289695ad9a10c9adc3cbe9963555cd410d1d83ceb9055463275b'
            '4dc8715a81bfd1297f99b3e5f41f9f50936bbf7779b9bc4ef9231261053b76ea')

_platform='64'

if [ "$CARCH" = 'i686' ]; then
  _platform='32'
  sha256sums[0]='bb5411150248cbf35d6bbc1f21a780ca490c9e801f0deff5fc6029920d0b76cc'
fi

source=("https://download.streamstudio.cc/streamstudio-${_platform}.zip"
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
  install -Dm644 "${srcdir}/1204.sh" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/CHANGELOG" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/config.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/credits.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/ffmpeg" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/gpl-2.0.txt" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/icudtl.dat" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/index.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/natives_blob.bin" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/nw_100_percent.pak" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/nw_200_percent.pak" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/org.freedesktop.streamstudio.policy" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/package.json" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/playlist.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/resources.pak" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/selectdir.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/snapshot_blob.bin" "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "${srcdir}/streamstudio" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/update.html" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/VERSION" "${pkgdir}/opt/${pkgname}/"
  install -Dm644 "${srcdir}/warning.html" "${pkgdir}/opt/${pkgname}/"

  # Directories
  cp -a "${srcdir}/css" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/fonts" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/images" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/js" "${pkgdir}/opt/${pkgname}/"
  cp -a "${srcdir}/lib" "${pkgdir}/opt/${pkgname}/"
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
