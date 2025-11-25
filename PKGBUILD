pkgname=noctune
pkgver=1.3.0
pkgrel=1
pkgdesc="A modern local music player. Built with Avalonia and .Net9."
arch=("x86_64")
url="https://github.com/raula09/LocalMusicPlayerApp"
license=("MIT")

depends=("vlc" "ffmpeg" "dotnet-runtime")
makedepends=("dotnet-sdk")

source=("https://github.com/raula09/LocalMusicPlayerApp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('942d3787b8c9131440c60f511dc7aba2f05acbbdf083296a486beb58853389ac')

build() {
  cd "${srcdir}/LocalMusicPlayerApp-${pkgver}"

  dotnet publish MusicPlayerApp.csproj \
    -c Release \
    -p:PublishSingleFile=false \
    -p:SelfContained=false \
    -p:DebugType=None \
    -p:Deterministic=true \
    -p:EnableCompressionInSingleFile=false \
    -o publish
}

package() {
  cd "${srcdir}/LocalMusicPlayerApp-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/noctune"
  cp -r publish/* "${pkgdir}/usr/lib/noctune/"

  install -dm755 "${pkgdir}/usr/bin"
  printf '%s\n' \
"#!/bin/bash" \
"exec dotnet /usr/lib/noctune/MusicPlayerApp.dll \"\$@\"" \
    > "${pkgdir}/usr/bin/noctune"
  chmod +x "${pkgdir}/usr/bin/noctune"

  install -Dm644 "${srcdir}/../noctune.desktop" \
    "${pkgdir}/usr/share/applications/noctune.desktop"

  install -Dm644 "${srcdir}/../noctune.png" \
    "${pkgdir}/usr/share/pixmaps/noctune.png"
}
