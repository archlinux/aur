# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-meet-bin
_name=${pkgname%-bin}
pkgver=1.0.9
pkgrel=1
pkgdesc='Secure, end-to-end encrypted video conferencing'
arch=(any)
url='https://proton.me/meet'
license=(GPL-3.0-or-later)
_electron=electron39
depends=(bash $_electron hicolor-icon-theme xdg-utils)
provides=($_name)
conflicts=($_name)
source=($_name-$pkgver.deb::https://proton.me/download/meet/linux/$pkgver/ProtonMeet-desktop.deb
        $_name.sh)
sha512sums=('0f1c0189d894b899a1370b7649e2a70763024397572f117817573ec3b7f9d9e9606e8a58aac4ed90779b85c2ec86bcfeb7483ded9e52d8afc7e76a45fe2c435d'
            '558644ebe5a0fb43fead451e93b65f4006108ea76fb5241b591fe06951f9d1be742ef6fbac307d86020d132eeee3a2c182604351144f7c750fe4f275c876ae9b')
b2sums=('4a1f632dd6fe691df56812af07498c43fca6c6cb2ff1894b205adc06d6cce4519bef7df6c428733d8a430c3a746ab8741add02618d96900407d3b269320d4d78'
        'cc16def864fd2e9134c194b473db94b0588871af895803fe4151ab7b715f66bbbb695a0964c03577da12b72397230626dabf186885cd206de412c8eac3a47e4a')

prepare() {
    # Extract only the files we need
    tar -xf data.tar.xz \
        "./usr/lib/$_name/resources/" \
        "./usr/lib/$_name/version" \
        "./usr/share/applications/$_name.desktop" \
        "./usr/share/pixmaps/$_name.png"

    # Find out which major release of electron this version of proton-meet requires
    local _electron_major=$(cat "usr/lib/$_name/version" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-meet.sh"
}

package() {
    install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"

    install -d "$pkgdir/usr/share/$_name"
    cp usr/lib/proton-meet/resources/* "$pkgdir/usr/share/$_name/"

    install -Dm644 usr/share/applications/$_name.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 usr/share/pixmaps/$_name.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
}
