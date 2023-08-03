# Maintainer: Mark Ignacio <mark@ignacio.io>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-multiarch-bin
_rpmversion=6.1.3035.257-1
pkgver=6.1.3035.257
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. Includes all supported architectures.'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
conflicts=('vivaldi')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'libnotify: native notifications'
)

source=('0001-add-support-for-user-flags.patch')
source_x86_64=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.x86_64.rpm")
source_aarch64=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.aarch64.rpm")
source_armv7h=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.armv7hl.rpm")

sha512sums=('334db2056114fdbf07407b1cee24284f019df7a15acd711ed016bab1a1ab211abf3884ed848f3496486e7c78056108ccf1e88547e22b787bc4f548c6785f64d2')
sha512sums_x86_64=('839ad6184915d448986b48fad9463974fd079999f7e6da5e11b2eb35047ad52a1f94cb885972d51f73b7a666370d047080dd7811c567c65ba0d5b1dc10b4ce82')
sha512sums_aarch64=('d72bf86940a3c115d3a8bec2c2f3c0cd0a20e3a57821085708bb920376bce574222fcb0f8c955cb6e6074f37cfdada6d12432cfae777ea3d08820426b188be46')
sha512sums_armv7h=('67f0d53f2e3ab9e307e1211f898a8cc4ea26149ec405a0bd62aaafce1b71ad2fcbee2be0102c14793e8fff448891079a377134116c51002e39b777da31262a85')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # add support for ~/.config/vivaldi-stable.conf
    patch -p1 -i "$srcdir/0001-add-support-for-user-flags.patch" \
        "$pkgdir/opt/vivaldi/vivaldi"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

    # make /usr/bin/vivaldi-stable available
    binf="$pkgdir/usr/bin/vivaldi-stable"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi/vivaldi "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
    done

    # install global icon in case hicolor theme gets bypassed
    install -Dm644 "$pkgdir/opt/vivaldi/product_logo_256.png" \
        "$pkgdir/usr/share/pixmaps/vivaldi.png"

    # license
    install -dm755 "$pkgdir/usr/share/licenses/vivaldi"
    w3m -dump "$pkgdir/opt/vivaldi/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/vivaldi/license.txt"
}