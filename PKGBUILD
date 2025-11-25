
pkgname=noctune
pkgver=1.3.0
pkgrel=1
pkgdesc="A modern local music player with a Spotify-inspired UI. Built with Avalonia and LibVLC."
arch=("x86_64")
url="https://github.com/raula09/LocalMusicPlayerApp"
license=("MIT")
depends=("vlc" "ffmpeg" "dotnet-runtime")
makedepends=("dotnet-sdk")
source=("https://github.com/raula09/LocalMusicPlayerApp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('942d3787b8c9131440c60f511dc7aba2f05acbbdf083296a486beb58853389ac')

build() {
  cd "${srcdir}/NoctuneMusicPlayer-${pkgver}"

  dotnet publish -c Release \
    -p:PublishSingleFile=false \
    -p:SelfContained=false \
    -p:EnableCompressionInSingleFile=false \
    -o publish
}

package() {
  cd "${srcdir}/NoctuneMusicPlayer-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/noctune"
  cp -r publish/* "${pkgdir}/usr/lib/noctune/"
  install -dm755 "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/noctune"
#!/bin/bash
exec dotnet /usr/lib/noctune/MusicPlayerApp.dll "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/noctune"

  install -Dm644 "${srcdir}/../noctune.desktop" "${pkgdir}/usr/share/applications/noctune.desktop"
  install -Dm644 "${srcdir}/../noctune.png" "${pkgdir}/usr/share/pixmaps/noctune.png"

}
