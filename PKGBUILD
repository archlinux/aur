# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.10.867.27
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (weekly snapshot)'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib' 'hicolor-icon-theme')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'google-chrome: Widevine DRM Plugin'
    'vivaldi-widevine: Widevine DRM Plugin'
)
source=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha512sums=('062ad7f1a398e23b649e5d59b5d895d4fc9b3eed1329ec45f1f24fcfbcbf2f99d50362a4be931a0cf38770a03e2e5c57e3066e12bf9d13ebf08397a9d7d5cf1b')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sanbox
    chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    binf="$pkgdir/usr/bin/vivaldi-snapshot"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/$pkgname "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
    done
}

