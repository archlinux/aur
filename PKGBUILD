# Maintainer: Lev Netreba <dev@lev-net.xyz>
pkgname=jplayer-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight music player using yt-dlp and ffmpeg, bundled with a custom runtime via jpackage"
arch=('x86_64')
url="https://github.com/thelevnet/jplayer"
license=('MIT')
depends=('yt-dlp' 'ffmpeg' 'alsa-utils')
makedepends=('java-environment>=21')
provides=('jplayer')
conflicts=('jplayer')
options=(!strip !debug)
source=("https://github.com/thelevnet/jplayer/releases/download/v${pkgver}/JPlayer.jar"
        "https://raw.githubusercontent.com/thelevnet/jplayer/main/res/icon.svg")
sha256sums=('SKIP' 'SKIP')

build() {
    rm -rf "${srcdir}/input" "${srcdir}/dist"
    mkdir -p "${srcdir}/input"
    cp "${srcdir}/JPlayer.jar" "${srcdir}/input/"

    jpackage \
      --type app-image \
      --input "${srcdir}/input" \
      --dest "${srcdir}/dist" \
      --name JPlayer \
      --main-jar JPlayer.jar \
      --main-class com.jplayer.Main
}

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/dist/JPlayer" "${pkgdir}/opt/jplayer"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/jplayer/bin/JPlayer "${pkgdir}/usr/bin/jplayer"

    install -Dm644 "${srcdir}/icon.svg" "${pkgdir}/usr/share/pixmaps/jplayer.svg"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/jplayer.desktop"
[Desktop Entry]
Type=Application
Name=JPlayer
Comment=Lightweight music player powered by yt-dlp
Exec=/usr/bin/jplayer
Icon=jplayer
Terminal=false
Categories=Audio;Music;Player;AudioVideo;
EOF
}
