# Maintainer: Mark Ignacio <mark@ignacio.io>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-multiarch-bin
_rpmversion=6.2.3105.47-1
pkgver=6.2.3105.47
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
sha512sums_x86_64=('b2a0f26c0b1c53e293744186bb276086ab8b6509c5a9bdb0d93aabcff3a48741b4bd36d290afdb6e00e3a362bb8f301bbdf515c9c6f9988d7751c11f7c48ea86')
sha512sums_aarch64=('8856b2bdb68ab9e5a5f2c10e54bc7f6a6fc2b7fcdb96f8bfcfbaf11b2f438451d6dfe4b1b04a48f1b830e40e69fa8c5a4eef2711dd226dc3014e7886c86b672e')
sha512sums_armv7h=('36cc48e07a5954b3843653b2b2a07dfec8c60f835676ae5ff20612b69da826ebc13b01e048b58a12da65e9e3d9c6edcd007160d447384c742439418bfe926e66')

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
