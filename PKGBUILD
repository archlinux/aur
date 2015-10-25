# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.303.32
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
sha256sums=('3eb1fd4111377350a8eee75301a5fe44a037a297572fe3f6b743c6db1ab19b1b')
sha256sums_i686=('0a28bb272c3c1b2bdbaae2f129738a1a83b4e7479d2b0d5e0a5593cf9fb5a9ce')
sha256sums_x86_64=('95b1d5bfc86adce0767e17d15ea643a208ec4d96afb2efbc86ce153003f85933')

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
    cd "$pkgdir/opt/vivaldi-snapshot"
    patch -p1 -i "$srcdir/vivaldi-ffmpeg-codecs.patch"
}

