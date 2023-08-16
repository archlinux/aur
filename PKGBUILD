# Maintainer: Mark Ignacio <mark@ignacio.io>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-multiarch-bin
_rpmversion=6.1.3035.302-1
pkgver=6.1.3035.302
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
sha512sums_x86_64=('ad3c6b1f121241c2ec09d2ee39a5d39568fadbe843bc9c3b09961c5f2804d1f3f0fd4241e6700251b793e915e3180130585bf50b2438875add2331458404d182')
sha512sums_aarch64=('85e415680abe123939c1861738ee79ac7206f4a33e15927e7d3e291ae9f678e690dcc77d9372808e8d2c5ac61d6ea7534a046f4fc83869fbd26aee98ea1d95f2')
sha512sums_armv7h=('7afabc458572cf96507d4da6946d799eca804be8a2a0ca057c78324913d66edf976cd8a50f81968467c168b79d5c0242f8b6fa568c23f31da99c577d28a70e15')

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
