# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-meet-bin
_name=${pkgname%-bin}
pkgver=1.0.14
pkgrel=1
pkgdesc='Secure, end-to-end encrypted video conferencing'
arch=(any)
url='https://proton.me/meet'
license=(GPL-3.0-or-later)
_electron=electron43
depends=(bash $_electron hicolor-icon-theme xdg-utils)
provides=($_name)
conflicts=($_name)
source=($_name-$pkgver.deb::https://proton.me/download/meet/linux/$pkgver/ProtonMeet-desktop.deb
        $_name.sh)
sha512sums=('883f0375567275b252e202c4a4e4114a0ac44a61fab62058dd8e1eb6f5e55be1b8db50ff675ac4cecbd5045390ba7b0c4c43960105e39a695cfec2a9de73ff52'
            '558644ebe5a0fb43fead451e93b65f4006108ea76fb5241b591fe06951f9d1be742ef6fbac307d86020d132eeee3a2c182604351144f7c750fe4f275c876ae9b')
b2sums=('63e875d1fe73a91bd51cc44539ce277f8d174ad26b51d25403b865cefe06ce93e41786582974f5674693372f4a798ddd66d9087ef1d1edc0ac39b5d7c32fe3ce'
        'cc16def864fd2e9134c194b473db94b0588871af895803fe4151ab7b715f66bbbb695a0964c03577da12b72397230626dabf186885cd206de412c8eac3a47e4a')

prepare() {
    # Extract only the files we need
    tar -xf data.tar.xz \
        "./usr/lib/$_name/resources/" \
        "./usr/lib/$_name/version" \
        "./usr/share/applications/$_name.desktop" \
        "./usr/share/icons"

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
    cp -a usr/share/icons "$pkgdir/usr/share/"

    install -Dm644 usr/share/applications/$_name.desktop -t "$pkgdir/usr/share/applications"
}
