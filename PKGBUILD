# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.16.1170.3
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (weekly snapshot)'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=('gtk3' 'libcups' 'nss' 'gconf' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'google-chrome: Widevine DRM Plugin'
    'vivaldi-widevine: Widevine DRM Plugin'
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha512sums=('9c0d0df26b67e5e690a7e2002079d366f0b6bdd061ebfd3f7de2416a9084e861d1f71e4a73d1c8ee85a78d4eddc1226d8d4907f29d044f1435a04377a5891e20')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/$pkgname/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    binf="$pkgdir/usr/bin/$pkgname"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/$pkgname "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/$pkgname/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
    done

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    strings "$pkgdir/opt/$pkgname/locales/en-US.pak" \
        | tr '\n' ' ' \
        | sed -rne 's/.*(<html lang.*>.*html>).*/\1/p' \
        | w3m -I 'utf-8' -T 'text/html' \
        > "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
}

