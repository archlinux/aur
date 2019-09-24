# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
_rpmversion=2.9.1675.11-1
pkgver=2.9.1675.11
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. Snapshot'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m' 'imagemagick')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'google-chrome: Widevine DRM Plugin'
    'vivaldi-widevine: Widevine DRM Plugin'
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${_rpmversion}.x86_64.rpm")
sha512sums=('41effedf330afaf67b9dee2ba608d4c565b757f31d0e5560df32d76ab71cb195fd36bd319e5dcaf28491ddd2baf878acb2c3e84e98ef8ca2d42c123c9685d8f6')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/$pkgname/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    binf="$pkgdir/usr/bin/$pkgname"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/$pkgname "$binf"
    fi

    # 256 and 24 are proper colored icons
    for res in 128 64 48 32; do
        convert "$pkgdir/opt/$pkgname/product_logo_256.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/$pkgname/product_logo_$res.png"
    done
    for res in 22 16; do
        convert "$pkgdir/opt/$pkgname/product_logo_24.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/$pkgname/product_logo_$res.png"
    done

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

