# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
_rpmversion=3.5.2115.73-1
pkgver=3.5.2115.73
pkgrel=3
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.x86_64.rpm"
        'eula.txt')
sha512sums=('ea1fe07051de22d4a2bfc60ed20b807a2e980c70103174aa3e3964b7532e0eca32d3de7d10b3a8c95daab8637a8fe0ff660af94d6c1638dc2e466412585c3d29'
            '7cbfc3258a92ee05eeb67c5b65a92aab27f34146fd097007de5eb8e2703610c03bfa52f7ee1d6055735f927b4dcc919a79b7caf6fb5a5a9596cac11cc083e874')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/$pkgname/vivaldi-sandbox"

    # make /usr/bin/vivaldi-stable available
    binf="$pkgdir/usr/bin/vivaldi-stable"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi/vivaldi "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/$pkgname/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
    done

    # license
    install -Dm644 "$srcdir/eula.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
}

