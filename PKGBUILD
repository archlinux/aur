# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
_rpmversion=5.1.2567.49-1
pkgver=5.1.2567.49
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.x86_64.rpm"
        '0001-add-support-for-user-flags.patch')
sha512sums=('21a462a08c3de602f0f3026f984fdaa9f3f712039ea8dc617be651b5569ee39e7e25b73744164d709e5763662deaa225911bbdc30f705a0631675803b79dc3c3'
            '334db2056114fdbf07407b1cee24284f019df7a15acd711ed016bab1a1ab211abf3884ed848f3496486e7c78056108ccf1e88547e22b787bc4f548c6785f64d2')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # add support for ~/.config/vivaldi-stable.conf
    patch -p1 -i "$srcdir/0001-add-support-for-user-flags.patch" \
        "$pkgdir/opt/$pkgname/$pkgname"

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

    # install global icon in case hicolor theme gets bypassed
    install -Dm644 "$pkgdir/opt/$pkgname/product_logo_256.png" \
        "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump "$pkgdir/opt/$pkgname/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
