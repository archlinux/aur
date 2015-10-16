# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.300.5
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'google-chrome: Widevine DRM Plugin'
)
source=('vivaldi-ffmpeg-codecs.patch')
source_i686=("https://vivaldi.com/download/snapshot/vivaldi-snapshot-${pkgver}-1.i386.rpm")
source_x86_64=("https://vivaldi.com/download/snapshot/vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha256sums=('690ded55e6fc87a3fc6e1e89324eeedab68d0990d213b0b3362318da3f343379')
sha256sums_i686=('da549c6854c965b0a949d4181ae5fbd7e773a0643382e4875866a2444b1d3b99')
sha256sums_x86_64=('396fbb2c554623ca071d4d5fbc6174738b7ab6789f97eec27f41b23e2f3528f6')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sanbox
    chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
    done

    # allow playback of proprietary video/audio when alternative ffmpeg.so is installed
    cd "$pkgdir"
    patch -p1 -i "$srcdir/vivaldi-ffmpeg-codecs.patch"
}

