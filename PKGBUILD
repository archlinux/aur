# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.298.15
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
sha256sums_i686=('4b5b4b4a3b3d192a4cb8cc351d58534650d5465d3a7ef1707d9edf2d3fcc059b')
sha256sums_x86_64=('f12afe7c2e99db5dc8bc2b4a665e06aa1b46fd8a35e2163106f0a0a1ff2c7d26')

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

